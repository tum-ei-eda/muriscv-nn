#! /usr/bin/env python3

import logging
import os
import git
import subprocess
import multiprocessing
import argparse


logging.basicConfig(
    level=logging.INFO, format="### PYTHON ### [%(asctime)s] %(pathname)s:%(lineno)d %(levelname)s - %(message)s"
)


class Progress(git.remote.RemoteProgress):
    def update(self, op_code, cur_count, max_count=None, message=""):
        print(self._cur_line, end="\r")


# TODO(fabianpedd): make these configurable from the terminal
class Config(object):

    # Path to RISC-V compiler (relative to muriscv_nn root directory)
    REL_TOOLCHAIN_DIR = "Toolchain/rv32gcv"
    TOOLCHAIN_BASENAME = "riscv32-unknown-elf"

    # RISC-V architecture and aplication binary interface to use
    RISCV_ARCH = "rv32gcv"
    RISCV_ABI = "ilp32d"

    # Memory layout
    PULPINO_ROM_START = 0x0000000
    PULPINO_ROM_SIZE = 0x800000
    PULPINO_RAM_START = 0x800000
    PULPINO_RAM_SIZE = 0x4000000

    BUILD_DIR_NAME = "build"
    BUILD_TYPE = "Release"  # Either 'Debug' or 'Release'

    ETISS_GIT_URL = "https://github.com/tum-ei-eda/etiss.git"
    ETISS_GIT_BRANCH = "master"
    # This is the directory etiss will be cloned into
    ETISS_GIT_DIR_NAME = "etiss-" + ETISS_GIT_BRANCH

    def __init__(self, muriscv_nn_dir):
        self.muriscv_nn_dir = muriscv_nn_dir
        self.abs_toolchain_dir = os.path.join(self.muriscv_nn_dir, self.REL_TOOLCHAIN_DIR)


def create_ini_file(path: str, config: Config):
    with open(path, "w") as f:
        f.write("[IntConfigurations]\n")
        # TODO(fabianpedd): Why is it necessary to make this larger than the rest? 0x10 times larger is just a random choice
        f.write(f"simple_mem_system.memseg_length_00=" + hex(config.PULPINO_ROM_START * 0x10) + "\n")
        f.write(f"simple_mem_system.memseg_length_00=" + hex(config.PULPINO_ROM_SIZE * 0x10) + "\n")
        f.write(f"simple_mem_system.memseg_origin_01=" + hex(config.PULPINO_RAM_START * 0x10) + "\n")
        f.write(f"simple_mem_system.memseg_length_01=" + hex(config.PULPINO_RAM_SIZE * 0x10) + "\n")


# TODO(fabianpedd): add stdout=subprocess.PIPE and only print with logging level debug
# TODO(fabianpedd): catch and handle expections from subprocess and (only then) print stderr / stdout using logging level error
#                  - https://docs.python.org/3/library/subprocess.html
#                  - https://docs.python.org/3/library/subprocess.html#subprocess.CalledProcessError
def setup_etiss(config: Config):

    # Clone ETISS
    config.etiss_dir = os.path.join(config.muriscv_nn_dir, "Sim/ETISS/", config.ETISS_GIT_DIR_NAME)
    logging.info("Cloning ETISS from %s into %s", config.ETISS_GIT_URL, config.etiss_dir)
    try:
        git.Repo.clone_from(config.ETISS_GIT_URL, config.etiss_dir, branch=config.ETISS_GIT_BRANCH, progress=Progress())
    except:
        logging.warning("ETISS directory %s already exists", config.etiss_dir)

    # Build ETISS
    config.etiss_dir_build = os.path.join(config.etiss_dir, config.BUILD_DIR_NAME)
    config.etiss_dir_install = os.path.join(config.etiss_dir_build, "install")
    logging.info("Building and installing ETISS into %s", config.etiss_dir_install)
    os.makedirs(config.etiss_dir_build, exist_ok=True)
    subprocess.run(
        [
            "cmake",
            "-S",
            config.etiss_dir,
            "-B",
            config.etiss_dir_build,
            "-DCMAKE_INSTALL_PREFIX=" + str(config.etiss_dir_install),
            "-DCMAKE_BUILD_TYPE=" + str(config.BUILD_TYPE),
        ],
        check=True,
    )
    subprocess.run(
        ["make", "-C", config.etiss_dir_build, "-j", str(multiprocessing.cpu_count()), "install"], check=True
    )

    # Build the ETISS processor example
    # config.etiss_dir_proc = os.path.join(config.etiss_dir_install, 'examples/bare_etiss_processor')
    # config.etiss_dir_proc_build = os.path.join(config.etiss_dir_proc, config.BUILD_DIR_NAME)
    # logging.info('Building ETISS processor example into %s', config.etiss_dir_proc_build)
    # os.makedirs(config.etiss_dir_proc_build, exist_ok=True)
    # subprocess.run(['cmake',
    #                '-S', config.etiss_dir_proc,
    #                '-B', config.etiss_dir_proc_build,
    #                '-DCMAKE_INSTALL_PREFIX=' + str(config.etiss_dir_install),
    #                '-DPULPINO_ROM_START=' + hex(config.PULPINO_ROM_START),
    #                '-DPULPINO_ROM_SIZE=' + hex(config.PULPINO_ROM_SIZE),
    #                '-DPULPINO_RAM_START=' + hex(config.PULPINO_RAM_START),
    #                '-DPULPINO_RAM_SIZE=' + hex(config.PULPINO_RAM_SIZE),
    #                '-DCMAKE_BUILD_TYPE=' + str(config.BUILD_TYPE)], check=True)
    # subprocess.run(['make',
    #                '-C', config.etiss_dir_proc_build,
    #                '-j', str(multiprocessing.cpu_count())], check=True)

    # Build the ETISS SW example
    config.etiss_dir_sw = os.path.join(config.etiss_dir_install, "examples/SW/riscv")
    config.etiss_dir_sw_build = os.path.join(config.etiss_dir_sw, config.BUILD_DIR_NAME)
    logging.info("Building ETISS software example into %s", config.etiss_dir_sw_build)
    os.makedirs(config.etiss_dir_sw_build, exist_ok=True)
    subprocess.run(
        [
            "cmake",
            "-S",
            config.etiss_dir_sw,
            "-B",
            config.etiss_dir_sw_build,
            "-DRISCV_ARCH=" + str(config.RISCV_ARCH),
            "-DRISCV_ABI=" + str(config.RISCV_ABI),
            "-DRISCV_ELF_GCC_PREFIX=" + str(config.abs_toolchain_dir),
            "-DRISCV_ELF_GCC_BASENAME=" + str(config.TOOLCHAIN_BASENAME),
            "-DPULPINO_ROM_START=" + hex(config.PULPINO_ROM_START),
            "-DPULPINO_ROM_SIZE=" + hex(config.PULPINO_ROM_SIZE),
            "-DPULPINO_RAM_START=" + hex(config.PULPINO_RAM_START),
            "-DPULPINO_RAM_SIZE=" + hex(config.PULPINO_RAM_SIZE),
            "-DCMAKE_BUILD_TYPE=" + str(config.BUILD_TYPE),
        ],
        check=True,
    )
    subprocess.run(["make", "-C", config.etiss_dir_sw_build, "-j", str(multiprocessing.cpu_count())], check=True)

    # Create custom_memsegs.ini file with custom memory segment configuration
    config.etiss_custom_memsegs = os.path.join(config.etiss_dir_install, "bin", "custom_memsegs.ini")
    create_ini_file(config.etiss_custom_memsegs, config)

    # Test the ETISS installation by executing the SW example once
    config.etiss_run_helper = os.path.join(config.etiss_dir_install, "bin", "run_helper.sh")
    config.etiss_riscv_example = os.path.join(config.etiss_dir_sw_build, "riscv_example.elf")
    logging.info("Running ETISS software example as toolchain check %s", config.etiss_riscv_example)
    try:
        run_args = [config.etiss_run_helper, config.etiss_riscv_example, "-i" + config.etiss_custom_memsegs]
        output = subprocess.run(run_args, check=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.decode(
            "utf-8"
        )
        if "hello world!" not in output:
            print(output)
            raise ValueError("Example software not printing 'hello world!' as expected")
    except Exception as ex:
        if isinstance(ex, subprocess.CalledProcessError):
            print(ex.output.decode("utf-8"))
        logging.error("ETISS installation appears to be non-functional!")

    logging.info("ETISS successfully build and tested! Use the run.sh script to invoke ETISS.")
    return


def main():
    # Config object to manage paths and configurations
    config = Config(
        muriscv_nn_dir=os.path.abspath(os.path.join(__file__, os.path.pardir, os.path.pardir, os.path.pardir))
    )

    # Get the ETIS simulator ready
    setup_etiss(config)


if __name__ == "__main__":
    main()

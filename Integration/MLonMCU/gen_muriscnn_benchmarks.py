import os
import argparse
import multiprocessing
import logging

# import mlonmcu
from mlonmcu.context.context import MlonMcuContext
from mlonmcu.session.run import RunStage
from mlonmcu.session.postprocess.postprocess import SessionPostprocess
from mlonmcu.models.lookup import apply_modelgroups
from mlonmcu.logging import get_logger, set_log_level

logger = get_logger()

# MURISCVNN_TOOLCHAIN = "gcc"


class CustomPostprocess(SessionPostprocess):  # RunPostprocess?
    """TODO"""

    def __init__(self, features=None, config=None):
        super().__init__("custom", features=features, config=config)

    def post_session(self, report):
        """Called at the end of a session."""
        df = report.post_df.copy()
        df["Kernels"] = df.apply(
            lambda row: "muRISCV-NN"
            if row.get("feature_muriscvnn") or row.get("feature_muriscvnnbyoc")
            else (
                "CMSIS-NN"
                if row.get("feature_cmsisnn") or row.get("feature_cmsisnnbyoc")
                else ("Autotuned" if row.get("feature_autotuned") else "Default")
            ),
            axis=1,
        )
        # TODO: allow combinations
        df["Extensions"] = df.apply(
            lambda row: "VEXT+PEXT"
            if row.get("feature_vext") and row.get("feature_pext")
            else (
                "VEXT"
                if row.get("feature_vext")
                else (
                    "PEXT"
                    if row.get("feature_pext")
                    else (
                        "MVEI+DSP"
                        if row.get("feature_arm_mvei") and row.get("feature_arm_dsp")
                        else ("MVEI" if row.get("feature_arm_mvei") else ("DSP" if row.get("feature_arm_dsp") else ""))
                    )
                )
            ),
            axis=1,
        )
        report.post_df = df


FRONTEND = "tflite"

TARGETS = [
    "spike",
    "ovpsim",
    "host_x86",
    "etiss_pulpino",
    "corstone300",
]

AUTOTUNED_TARGETS = ["spike", "ovpsim", "etiss_pulpino"]

DEFAULT_TARGETS = [
    "spike",
    # "host_x86",
    # "etiss_pulpino",
    "corstone300",
]

PLATFORM = "mlif"

BACKENDS = [
    "tflmi",
    "tvmaot",
    # TODO: tvmllvm, tvmaotplus
]
DEFAULT_BACKENDS = [
    "tflmi",
    "tvmaot",
]

FEATURES = [
    "muriscvnn",
    "cmsisnn",
    "vext",
    "pext",
    "arm_dsp",
    "arm_mvei",
    "auto_vectorize",
    "none",  # TODO: needed?
]

DEFAULT_FEATURES = [
    "muriscvnn",
    "cmsisnn",
    "vext",
    "pext",
    # "arm_dsp",
    # "arm_mvei",
]

TUNING_RECORDS = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "riscv_cpu_v0.01.log.best",
)


def get_target_features(target, enable_default=True, enable_scalar=True, enable_vext=True, enable_pext=True, enable_dsp=False, enable_mvei=False, enable_muriscvnn=False, enable_cmsisnn=False, scalar_default_only=False):
    # print("get_target_features", target, enable_default, enable_vext, enable_pext, enable_muriscvnn, enable_cmsisnn)
    DEFAULT_SCALAR = [[] if enable_scalar else []]
    DEFAULT_VEXT = [["vext"] if not scalar_default_only and enable_vext else []]
    DEFAULT_PEXT = [["pext"] if not scalar_default_only and enable_pext else []]
    DEFAULT_DSP = [["dsp"] if not scalar_default_only and enable_dsp else []]
    DEFAULT_MVEI = [["mvei"] if not scalar_default_only and enable_mvei else []]
    MURISCVNN_SCALAR = [["muriscvnn"] if enable_scalar else []]
    MURISCVNN_VEXT = [["muriscvnn", "vext"] if enable_vext else []]
    MURISCVNN_PEXT = [["muriscvnn", "pext"] if enable_pext else []]
    CMSISNN_SCALAR = [["cmsisnn"] if enable_scalar else []]
    CMSISNN_DSP = [["cmsisnn", "arm_dsp"] if enable_dsp else []]
    CMSISNN_MVEI = [["cmsisnn", "arm_mvei", "arm_dsp"] if enable_mvei else []]
    TARGET_FEATURES = {
        "spike": [
            *([*DEFAULT_SCALAR, *DEFAULT_VEXT, *DEFAULT_PEXT] if enable_default else []),
            *([*MURISCVNN_SCALAR, *MURISCVNN_VEXT, *MURISCVNN_PEXT] if enable_muriscvnn else []),
            *([*CMSISNN_SCALAR] if enable_cmsisnn else []),
        ],
        "ovpsim": [
            *([*DEFAULT_SCALAR, *DEFAULT_VEXT, *DEFAULT_PEXT] if enable_default else []),
            *([*MURISCVNN_SCALAR, *MURISCVNN_VEXT, *MURISCVNN_PEXT] if enable_muriscvnn else []),
            *([*CMSISNN_SCALAR] if enable_cmsisnn else []),
        ],
        "host_x86": [
            *([*DEFAULT_SCALAR] if enable_default else []),
            *([*MURISCVNN_SCALAR] if enable_muriscvnn else []),
            *([*CMSISNN_SCALAR] if enable_cmsisnn else []),
        ],
        "etiss_pulpino": [
            *([*DEFAULT_SCALAR] if enable_default else []),
            *([*MURISCVNN_SCALAR] if enable_muriscvnn else []),
            *([*CMSISNN_SCALAR] if enable_cmsisnn else []),
        ],
        "corstone300": [
            *([*DEFAULT_SCALAR, *DEFAULT_DSP, *DEFAULT_MVEI] if enable_default else []),
            *([*MURISCVNN_SCALAR] if enable_muriscvnn else []),
            *([*CMSISNN_SCALAR, *CMSISNN_DSP, *CMSISNN_MVEI] if enable_cmsisnn else []),
        ],
    }
    temp = TARGET_FEATURES[target]
    # print("temp", temp)
    # hacky way to remove duplicates
    temp2 = []
    temp3 = []
    for x in temp:
        y = ";".join(x)
        if y in temp3:
            continue
        temp3.append(y)
        temp2.append(x)
    # print("temp2", temp2)
    # input("111")
    return temp2


VALIDATE_FEATURES = ["validate", "debug"]

TARGET_ARCH = {
    "spike": "riscv",
    "ovpsim": "riscv",
    "x86": "x86",
    "etiss_pulpino": "riscv",
    "corstone300": "arm",
}

BACKEND_DEFAULT_FEATURES = {
    "tflmi": [],
    "tvmaot": ["unpacked_api", "usmp"],
}


def get_backend_features(backend, target, enable_autotuned=False):
    BACKEND_FEATURES = {
        "tflmi": [[]],
        "tvmaot": [[], *([["autotuned"]] if enable_autotuned and target in AUTOTUNED_TARGETS else [])],
    }
    return BACKEND_FEATURES[backend]


def get_backend_config(backend, features, enable_autotuned=False):
    BACKEND_FEATURES = {
        "tflmi": [{}],
        "tvmaot": [
            *([{}] if "muriscvnn" in features or "cmsisnn" in features else []),
            *(
                [{"tvmaot.desired_layout": "NCHW"}, {"tvmaot.desired_layout": "NHWC"}]
                if "muriscvnn" not in features and "cmsisnn" not in features
                else []
            ),
        ],
    }
    ret = BACKEND_FEATURES[backend]
    if enable_autotuned and backend == "tvmaot":
        for cfg in ret:
            cfg.update({"autotuned.results_file": TUNING_RECORDS})
    return ret


DEFAULT_CONFIG = {
    "mlif.num_threads": 4,
    "mlif.optimize": "s",
    "mlif.fuse_ld": "none",
    "run.export_optional": True,
    "mlif.verbose_makefile": True,
    "mlif.print_outputs": True,
}

BACKEND_DEFAULT_CONFIG = {
    "tflmi": {},
    "tvmaot": {"usmp.algorithm": "hill_climb"},
}

VLENS = [64, 128, 256, 512, 1024, 2048]

DEFAULT_VLENS = [64, 128, 256, 512, 1024, 2048]

TOOLCHAINS = ["gcc", "llvm"]

DEFAULT_TOOLCHAINS = ["gcc"]

MODELS = [
    # "sine_model",
    # "magic_wand",
    # "micro_speech",
    # "cifar10",
    # "simple_mnist",
    "aww",
    "vww",
    "resnet",
    "toycar",
]

POSTPROCESSES_0 = [
    "features2cols",
    "config2cols",
]

POSTPROCESSES_1 = [
    "rename_cols",
    "filter_cols",
]

POSTPROCESS_CONFIG = {
    "filter_cols.keep": [
        "Model",
        "Backend",
        "Target",
        "Run Cycles",
        "Run Cycles (rel.)",
        "Runtime [s]",
        "Total ROM",
        "Total ROM (rel.)",
        "Total RAM",
        "Total RAM (rel.)",
        "ROM read-only",
        "ROM code",
        # "ROM read-only",
        # "ROM code",
        # "ROM misc",
        # "RAM data",
        # "RAM zero-init data",
        # "Incomplete",
        "Failing",
        "Features",
        # "Comment",
        # "Validation",
        "Kernels",
        "Extensions",
        "VLEN",
        "Layout",
        "Toolchain",
        "AutoVectorize",
    ],
    "rename_cols.mapping": {
        "config_spike.vlen": "VLEN",
        "config_ovpsim.vlen": "VLEN",
        "config_tvmaot.desired_layout": "Layout",
        "config_mlif.toolchain": "Toolchain",
        "feature_auto_vectorize": "AutoVectorize",
    },
    "filter_cols.drop_nan": True,
    "compare_rows.to_compare": None,  # Figure out automatically (All metrics, expects those filtered out later)
    "compare_rows.group_by": None,  # Figure out outomatically
    "compare_rows.percent": False,  # Set to True to multiply values by 100.0
    "compare_rows.invert": False,  # Set to True to 1/x values, which might make sense when considering speedups
    "compare_rows.substract": False,  # Set to True to make the baseline 0.0 instead of 1.0
}

def gen_features(backend, features, validate=False, auto_vectorize=False):
    ret = []
    ret.extend(BACKEND_DEFAULT_FEATURES[backend])
    if validate:
        ret += VALIDATE_FEATURES
    if backend == "tvmaot":
        # Rename muriscvnn -> muriscvnnbyoc etc.
        for feature in features:
            if "muriscvnn" in feature:
                ret.append("muriscvnnbyoc")
            elif "cmsisnn" in feature:
                ret.append("cmsisnnbyoc")
            else:
                ret.append(feature)
    else:
        ret += features
    if auto_vectorize:
        ret.append("auto_vectorize")
    return ret


def gen_config(backend, backend_config, features, vlen, toolchain, enable_postprocesses=False, baseline=None, scalar_default_only=False):
    ret = {}
    ret["mlif.toolchain"] = toolchain
    ret.update(DEFAULT_CONFIG)
    ret.update(BACKEND_DEFAULT_CONFIG[backend])
    ret.update(backend_config)
    if enable_postprocesses:
            ret.update(POSTPROCESS_CONFIG)
    if "pext" in features:
        assert "vext" not in features
        assert vlen == 0
        if "muriscvnn" in features or "muriscvnnbyoc" in features:
            if backend == "tvmaot":
                ret["muriscvnnbyoc.mcpu"] = "cortex-m33"
    if "vext" in features:
        assert "pext" not in features
        if "muriscvnn" in features or "muriscvnnbyoc" in features:
            if backend == "tvmaot":
                ret["muriscvnnbyoc.mcpu"] = "cortex-m55"
        if not scalar_default_only or "muriscvnn" in features or "muriscvnnbyoc" in features:
            ret["vext.vlen"] = vlen
    # else:
    # assert vlen == 0
    if "cmsisnnbyoc" in features:
        assert backend == "tvmaot"
        if "arm_mvei" in features:
            ret["cmsisnnbyoc.mcpu"] = "cortex-m55"
        elif "arm_dsp" in features:
            ret["cmsisnnbyoc.mcpu"] = "cortex-m33"
    if baseline is not None:
        ret["compare_rows.baseline"] = baseline
    return ret


def benchmark(args):
    with MlonMcuContext() as context:
        user_config = context.environment.vars  # TODO: get rid of this workaround
        with context.create_session(label=args.label) as session:
            models = apply_modelgroups(args.models, context=context)
            for model in models:
                # print("model", model)
                for backend in args.backend:
                    # print("backend", backend)
                    for target in args.target:
                        # print("target", target)
                        for toolchain in args.toolchain:
                            # print("toolchain", toolchain, args.toolchain)
                            # input("1111")
                            enable_default = not args.skip_default
                            enable_vext = "vext" in args.feature
                            enable_pext = "pext" in args.feature
                            enable_dsp = "arm_dsp" in args.feature
                            enable_mvei = "arm_mvei" in args.feature
                            enable_muriscvnn = "muriscvnn" in args.feature
                            enable_cmsisnn = "cmsisnn" in args.feature
                            enable_auto_vectorize = "auto_vectorize" in args.feature
                            scalar_default_only = args.scalar_default_only
                            for target_features in get_target_features(
                                target,
                                enable_default=enable_default,
                                enable_vext=enable_vext,
                                enable_pext=enable_pext,
                                enable_dsp=enable_dsp,
                                enable_mvei=enable_mvei,
                                enable_muriscvnn=enable_muriscvnn,
                                enable_cmsisnn=enable_cmsisnn,
                                scalar_default_only=scalar_default_only,
                            ):
                                # print("tf", target_features)
                                if toolchain == "llvm" and "pext" in target_features:
                                    # print("CONT")
                                    continue  # LLVM does not support pext!
                                enable_autotuned = False
                                if args.autotuned:
                                    if (
                                        "cmsisnn" not in target_features
                                        and "muriscvnn" not in target_features
                                        and backend == "tvmaot"
                                    ):
                                        enable_autotuned = True
                                for backend_features in get_backend_features(
                                    backend, target, enable_autotuned=enable_autotuned
                                ):
                                    # print("bf", backend_features)
                                    features = list(set(target_features + backend_features))
                                    for backend_config in get_backend_config(
                                        backend, features, enable_autotuned=enable_autotuned
                                    ):
                                        # print("bc", backend_config)
                                        vlens = [0]
                                        if "vext" in features:
                                            vlens = args.vlen
                                        features = gen_features(backend, features, validate=args.validate, auto_vectorize=enable_auto_vectorize)
                                        # print("fff", features)
                                        for vlen in vlens:
                                            # print("vl", vlen)
                                            # input("9")
                                            config = gen_config(
                                                backend, backend_config, features, vlen, toolchain=toolchain, enable_postprocesses=args.post, baseline=args.baseline, scalar_default_only=scalar_default_only
                                            )
                                            config.update(user_config)  # TODO
                                            # resolve_missing_configs(config, features, target, context)
                                            run = session.create_run(config=config)
                                            run.add_features_by_name(features, context=context)
                                            run.add_platform_by_name(PLATFORM, context=context)
                                            run.add_frontend_by_name(FRONTEND, context=context)
                                            run.add_model_by_name(model, context=context)
                                            run.add_backend_by_name(backend, context=context)
                                            run.add_target_by_name(target, context=context)
                                            if args.post:
                                                run.add_postprocesses_by_name(POSTPROCESSES_0)
                                                run.add_postprocess(CustomPostprocess(), append=True)
                                                run.add_postprocesses_by_name(POSTPROCESSES_1, append=True)
                                                if args.baseline is not None:
                                                    run.add_postprocess_by_name("compare_rows", append=True)
            if args.noop:
                stage = RunStage.LOAD
            else:
                stage = RunStage.RUN
            session.process_runs(until=stage, num_workers=args.parallel, progress=args.progress, context=context)
            report = session.get_reports()
        report_file = args.output
        report.export(report_file)
        print()
        print(report.df)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "models",
        metavar="model",
        type=str,
        # nargs="+",
        nargs="*",
        default=MODELS,
        help="Model to process",
    )
    parser.add_argument(
        "-b",
        "--backend",
        type=str,
        action="append",
        choices=BACKENDS,
        # default=DEFAULT_BACKENDS,
        default=[],
        help=f"Backends to use (default: {DEFAULT_BACKENDS})",
    )
    parser.add_argument(
        "-t",
        "--target",
        type=str,
        action="append",
        choices=TARGETS,
        # default=DEFAULT_TARGETS,
        default=[],
        help=f"Targets to use (default: {DEFAULT_TARGETS}s)",
    )
    parser.add_argument(
        "-f",
        "--feature",
        type=str,
        action="append",
        choices=FEATURES,
        # default=default_features,
        default=[],
        help=f"features to use (default: {DEFAULT_FEATURES})",
    )
    parser.add_argument(
        "--vlen",
        type=int,
        action="append",
        choices=VLENS,
        # default=DEFAULT_VLENS,
        default=[],
        help=f"VLENS to use (RISC-V only) (default: {DEFAULT_VLENS})",
    )
    parser.add_argument(
        "--toolchain",
        type=str,
        action="append",
        choices=TOOLCHAINS,
        # default=DEFAULT_TOOLCHAINS,
        default=[],
        help=f"toolchains to use (RISC-V only) (default: {DEFAULT_TOOLCHAINS})",
    )
    parser.add_argument(
        "--baseline",
        type=int,
        default=None,
        help=f"Compare results with this row (default: skip comparison)",
    )
    parser.add_argument(
        "--validate",
        action="store_true",
        help="Validate model outputs (default: %(default)s)",
    )
    parser.add_argument(
        "--autotuned",
        action="store_true",
        help="Use tuning records, if available (default: %(default)s)",
    )
    parser.add_argument(
        "--skip-default",
        dest="skip_default",
        action="store_true",
        help="Do not generate benchmarks for reference runs (default: %(default)s)",
    )
    parser.add_argument(
        "--scalar-default-only",
        action="store_true",
        help="TODO",
    )
    parser.add_argument(
        "--post",
        action="store_true",
        help="Run postprocesses after the session (default: %(default)s)",
    )
    parser.add_argument(
        "-p",
        "--progress",
        action="store_true",
        help="Display progress bar (default: %(default)s)",
    )
    parser.add_argument(
        "--parallel",
        metavar="THREADS",
        nargs="?",
        type=int,
        const=multiprocessing.cpu_count(),
        default=1,
        help="Use multiple threads to process runs in parallel (%(const)s if specified, else %(default)s)",
    )
    parser.add_argument(
        "--output",
        "-o",
        metavar="FILE",
        type=str,
        default=os.path.join(os.getcwd(), "out.csv"),
        help="""Output CSV file (default: %(default)s)""",
    )
    parser.add_argument(
        "--label",
        metavar="NAME",
        type=str,
        default="",
        help="Used name for storing report in MLonMCU environment",
    )
    parser.add_argument(
        "--verbose",
        "-v",
        action="store_true",
        help="Print detailed messages for easier debugging (default: %(default)s)",
    )
    parser.add_argument(
        "--noop",
        action="store_true",
        help="Skip processing runs. (default: %(default)s)",
    )
    args = parser.parse_args()
    if not args.backend:
        args.backend = DEFAULT_BACKENDS
    if not args.target:
        args.target = DEFAULT_TARGETS
    if not args.feature:
        args.feature = DEFAULT_FEATURES
    if not args.vlen:
        args.vlen = DEFAULT_VLENS
    if not args.toolchain:
        args.toolchain = DEFAULT_TOOLCHAINS
    if "none" in args.feature:
        assert len(args.feature) == 1
        args.feature = []
    if args.verbose:
        set_log_level(logging.DEBUG)
    else:
        set_log_level(logging.INFO)
    print("args", args)
    benchmark(args)


if __name__ == "__main__":
    main()

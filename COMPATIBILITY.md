# muRISCV-NN Compatibility

In the following, we list the supported 3rd party tools for every muRISCV-NN release starting with `v0.1.0`.

While the git tags/versions you can find here are verified to work together, it is like that (slightly) newer/older commits would also work. Als

## Matching CMSIS-NN Commits

| **muRISCV-NN**             | **CMSIS-NN ** | **Comment** |
|----------------------------|---------------|-------------|
|   N/A (`3454f4e18cd6d0e70f58cd43fa6c27bf5f42fa4a`)  |  `v6.0.0`           |             |
|   N/A (`5474a6a63e73e5d4d35e42df32030e6b13943255`)  |  `42a38b4cd0e901bd90747ec13efb0d023fe789c6`           |             |
|   `v0.1.0` (`abcdef0123`)  |   ?           |             |
|   `v0.2.0` ()              |   ...         |             |

_(Last updated: ?)_

## Deployment Frameworks

| **muRISCV-NN**            | **TFLM** | **TVM** | **Comment** |
|----------------------------|-------------|------------|--------------|
|   N/A (`3454f4e18cd6d0e70f58cd43fa6c27bf5f42fa4a`)  | `19aaea85e4679a9a2f265e07ba190ac5ea4d3766`            | ``v0.17.0`           |              |
|   N/A (`5474a6a63e73e5d4d35e42df32030e6b13943255`)  | `8eb6b23de4470d6a8da3131650d6a67514dfa130`            | `v0.17.0`           |              |
|   `v0.1.0` (`abcdef0123`)  |  ?           |     ?       |              |

_(Last Update: 02.11.2024)_

## RISC-V Toolchains

| **muRISCV-NN**            | **GCC (GNU)** | **LLVM** | **Comment** |
|----------------------------|------------------|-------------|--------------|
|   N/A (`3454f4e18cd6d0e70f58cd43fa6c27bf5f42fa4a`)  |   `13.2.0` (`2024.09.03`)         |   `18.1.8`      |              |
|   N/A (`5474a6a63e73e5d4d35e42df32030e6b13943255`)  |   `13.2.0` (`2024.09.03`)         |   `18.1.8`      |              |
|   N/A (`?`)  |   `14.?` (`2024.09.03_gcc14`)         |   `19.1.?`     |              |
|   `v0.1.0` (`abcdef0123`)  |   `?` (`?`)         |   `?`      |              |

_(Last Update: 02.11.2024)_

## RISC-V Simulators

| **muRISCV-NN**            | **Spike (PK)** | **riscvOVPSim**              | **ETISS** | **Comment** |
|----------------------------|-------------------|---------------------------------|--------------|-------------|
|   N/A (`3454f4e18cd6d0e70f58cd43fa6c27bf5f42fa4a`)  |   `88fc84ded155a9e01987c4dfb7a77800e69b232b` (`1a52fa44aba49307137ea2ad5263613da33a877b`)           |   discontinued @ December 2023  |   `?`          |             |
|   N/A (`5474a6a63e73e5d4d35e42df32030e6b13943255`)  |   `88fc84ded155a9e01987c4dfb7a77800e69b232b` (`1a52fa44aba49307137ea2ad5263613da33a877b`)           |   discontinued @ December 2023  |   `?`          |             |
|   `v0.1.0` (`abcdef0123`)  |   `?` (`?`)           |   N/A  |   ?          |             |

_(Last Update: 02.11.2024)_

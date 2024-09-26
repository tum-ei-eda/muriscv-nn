import csv
import argparse

blank = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-r",
        "--reference",
        type=str,
        action="store",
        help="Path to reference benchmark .csv",
    )
    parser.add_argument(
        "-b",
        "--benchmark",
        type=str,
        action="store",
        help="Path to newly generated benchmark .csv",
    )

    args = parser.parse_args()

    with open(args.reference, newline="") as file:
        reference_csv = list(csv.reader(file))

    with open(args.benchmark, newline="") as file:
        benchmark_csv = list(csv.reader(file))

    output_csv = []
    output_csv.append(benchmark_csv[0])

    for benchmark in benchmark_csv:
        if benchmark[0] != "Session":
            for reference in reference_csv:
                if benchmark[2] == reference[2] and set(benchmark[16]) == set(reference[16]):
                    output_csv.append(reference)
                    output_csv.append(benchmark)

                    difference = [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        int(reference[8]) - int(benchmark[8]),
                        float(reference[9]) - float(benchmark[9]),
                        int(reference[10]) - int(benchmark[10]),
                        int(reference[11]) - int(benchmark[11]),
                        int(reference[12]) - int(benchmark[12]),
                        int(reference[13]) - int(benchmark[13]),
                        int(reference[14]) - int(benchmark[14]),
                        int(reference[15]) - int(benchmark[15]),
                        int(reference[16]) - int(benchmark[16]),
                        "",
                        "",
                        "",
                        "",
                    ]

                    output_csv.append(difference)

                    percent_diff = [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        float(difference[8]) / float(reference[8]) * 100,
                        "",
                        float(difference[10]) / float(reference[10]) * 100,
                        float(difference[11]) / float(reference[11]) * 100,
                        float(difference[12]) / float(reference[12]) * 100,
                        float(difference[13]) / float(reference[13]) * 100,
                        float(difference[14]) / float(reference[14]) * 100,
                        float(difference[15]) / float(reference[15]) * 100,
                        float(difference[16]) / float(reference[16]) * 100,
                        "",
                        "",
                        "",
                        "",
                    ]

                    output_csv.append(percent_diff)

                    output_csv.append(blank)

    with open("benchmark_stats.csv", "w", newline="") as file:
        writer = csv.writer(file, delimiter=",")
        writer.writerows(output_csv)


if __name__ == "__main__":
    main()

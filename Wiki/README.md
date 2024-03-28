# Wiki Scripts

This directory contains scripts to generate the benchmark tables in the [Wiki](https://github.com/tum-ei-eda/muriscv-nn/wiki)

## Wiki Repositoy

The Wiki including the raw benchmark data as well as the formatted tables can be cloned via:

```
git clone https://github.com/tum-ei-eda/muriscv-nn.wiki.git
```

## Usage

1. Clone Wiki repository (see above)

2. Generate Benchmark Data

  - Locally (See `Integration/MLonMCU/mlonmcu_benchmarks.sh`)
  - Via GitHub Actions (See `.github/workflows/benchmark_test.yml`)

3. Process generated CSV report(s)

```bash
python3 create_wiki.py paper_data/*/out.csv --split
```

4. Upload generated CSV and Markdown files to wiki repo

```bash
cp Benchmarks-*.md muriscv-nn.wiki/
cp Benchmarks-*.csv muriscv-nn.wiki/
cd muriscv-nn.wiki/
git add --all
git commit -m "Add new files"
git push origin master
```

## Command line options

TODO

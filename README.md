# Gauge Benchmark

Seed projects and scripts to capture stats for gauge execution. Over time, this should reveal comparisons across gauge versions.

## Running the benchmark

- `./benchmark.sh [output_dir(default=./out)] [directory(default=all)]`

## Running against another project

- Copy over the new project to the root of this project
- Create a `run.sh` file in the root of the new project, that should invoke the run for all combinations to be benchmarked. See [`java_simple/run.sh`](java_simple/run.sh) for reference.

## What is captured?

- the script attempts to capture %CPU, Memory, execution time and the exit code. It uses the unix `time` command.

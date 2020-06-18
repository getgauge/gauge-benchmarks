#! /bin/bash

set -e

shopt -s extglob

out_dir=${1:-out}
export BENCHMARK_OUT_DIR=$(realpath $out_dir)
glob_pattern=${2:-!($out_dir)}

mkdir -p $BENCHMARK_OUT_DIR

export REVISION=`gauge version | grep "Commit Hash:" | awk '/Commit Hash: /{print $NF}'`

for d in $glob_pattern/; do
    echo "run $d in serial"
    $(cd $d && ./run.sh)
    echo "run $d in parallel"
    $(cd $d && PARALLEL=true enable_multithreading=false ./run.sh)
    echo "run $d in parallel multithreaded"
    $(cd $d && PARALLEL=true enable_multithreading=true ./run.sh)
done
run="serial"

if [ "$PARALLEL" = "true" ]; then
    run="parallel"
    flags="-p"
fi

if [ "$enable_multithreading" = "true" ]; then
    run+="_multithreaded"
fi
REVISION=`gauge version | grep "Commit Hash:" | awk '/Commit Hash: /{print $NF}'`
out_file="$BENCHMARK_OUT_DIR/java_simple_$run.csv"

printf "%s," $REVISION >> $out_file

/usr/bin/time -f "%P,%M,%E,%x" -a -o $out_file gauge run specs $flags > /dev/null 2>&1

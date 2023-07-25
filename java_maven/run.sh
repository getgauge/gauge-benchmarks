run="serial"

if [ "$PARALLEL" = "true" ]; then
    run="parallel"
    flags="-DinParallel=true"
fi

if [ "$enable_multithreading" = "true" ]; then
    run="multithreaded"
fi
REVISION=`gauge version | grep "Commit Hash:" | awk '/Commit Hash: /{print $NF}'`
out_file="$BENCHMARK_OUT_DIR/java_maven_$run.csv"

printf "%s," $REVISION >> $out_file

mvn test-compile > /dev/null 2>&1
/usr/bin/time -f "%P,%M,%E,%x" -a -o $out_file mvn -q gauge:execute $flags > /dev/null 2>&1


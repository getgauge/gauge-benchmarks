run="serial"

if [ "$PARALLEL" = "true" ]; then
    run="parallel"
    flags="-PinParallel=true"
fi

if [ "$enable_multithreading" = "true" ]; then
    run="multithreaded"
fi
REVISION=`gauge version | grep "Commit Hash:" | awk '/Commit Hash: /{print $NF}'`
out_file="$BENCHMARK_OUT_DIR/java_gradle_$run.csv"

printf "%s," $REVISION >> $out_file

./gradlew clean > /dev/null 2>&1
/usr/bin/time -f "%P,%M,%E,%x" -a -o $out_file ./gradlew --no-daemon --no-build-cache gauge $flags > /dev/null 2>&1

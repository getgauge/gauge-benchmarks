run="serial"

if [ "$PARALLEL" = "true" ]; then
    run="parallel"
    flags="-PinParallel=true"
fi

if [ "$enable_multithreading" = "true" ]; then
    run+="_multithreaded"
fi

./gradlew clean > /dev/null 2>&1
/usr/bin/time -f "%P,%M,%E,%x" -a -o "$BENCHMARK_OUT_DIR/java_gradle_$run.csv" ./gradlew --no-daemon --no-build-cache gauge -PinParallel=true > /dev/null 2>&1

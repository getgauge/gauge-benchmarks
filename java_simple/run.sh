run="serial"

if [ "$PARALLEL" = "true" ]; then
    run="parallel"
    flags="-p"
fi

if [ "$enable_multithreading" = "true" ]; then
    run+="_multithreaded"
fi

/usr/bin/time -f "%P,%M,%E,%x" -a -o "$BENCHMARK_OUT_DIR/java_simple_$run.csv" gauge run specs $flags > /dev/null 2>&1

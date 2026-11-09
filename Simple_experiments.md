# Two simple experiments

Run commands from the directory `M2R-ParallelQuicksort/`. Avoid heavy background activity.

## 1. Array size

**What:** Find out at which tested sizes parallel quicksort is faster than sequential quicksort.

**How:** Build with the original `-O0` settings, then use the existing script:

```bash
make -B -C src
bash scripts/run_benchmarking.sh
```

The script tests **00 200 500 1000 2000 5000 10000 20000 50000 100000 200000 400000 600000 800000 1000000 elements**, five times each.
Feel free to add as many values as you want.

It saves results in `data/<machine>_<date>/measurements_<hour:minute>.txt`. Rename the new timing file to `array_O0.txt` before running another experiment. Do not append to an existing measurement file.

Compare mean sequential and parallel times at each size. Keep libc `qsort` as an additional reference.

## 2. Compiler optimization

**What:** Find out whether `-O2` changes execution times and parallel speedup compared with `-O0`.

**How:** Keep the same source, sizes, repetitions, and machine conditions. Reuse the `array_O0.txt` results, then force an optimized rebuild:

```bash
make -B -C src 'CFLAGS=$(WARNINGS) -pthread -lrt -std=c99 -O2'
bash scripts/run_benchmarking.sh
```

The final `-O2` overrides the earlier `-O0`, preserving the other original flags.

Rename the new timing file to `array_O2.txt` and validate it as above. Compare `-O0` and `-O2` mean times and speedup **at the same size**.

For either experiment, use the existing extractor after checking the raw output (replace the paths):

```bash
perl scripts/csv_quicksort_extractor2.pl < path/to/results.txt > path/to/results.csv
```

**Speedup = mean sequential time / mean parallel time.**s
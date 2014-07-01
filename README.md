# require-benchmark

Benchmarks to test a new require feature

## Preparation

```
$ create-data.sh
```

Will create the testdata. It will also download a node webserver for tests
on a real world example.

## My Testplan
1. ./create-data.sh

2. reboot, then wait 20 secs
3. ./run-benchmark hapi

4. reboot, then wait 20 secs
5. ./run-benchmark flat

6. reboot, then wait 20 secs
7. ./run-benchmark nested

## My Results

### hapi

### flat

### nested

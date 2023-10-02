#!/bin/bash

for bench in {vexriscv_soc,picorv32}
do

  echo "Parse in $bench"

  pushd $bench
  python ../../scripts/parse-results.py
  popd

done


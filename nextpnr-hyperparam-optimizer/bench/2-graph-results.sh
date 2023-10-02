#!/bin/bash

for bench in {vexriscv_soc,picorv32}
do

  echo "Graph in $bench"

  pushd $bench
  python ../../scripts/graph-results.py
  popd

done


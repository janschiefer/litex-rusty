#!/bin/bash

for bench in {vexriscv_soc, picorv32}
do

  echo "Brute-force in $bench"

  pushd $bench
  python nextpnr-explore.py
  popd

done

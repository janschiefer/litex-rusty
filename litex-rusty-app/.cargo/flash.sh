#!/usr/bin/env bash
set -ex
# Create bin file
riscv64-unknown-elf-objcopy $1 -O binary $1.bin
# Program iCEBreaker
litex_term --kernel $1.bin /dev/ttyUSB0

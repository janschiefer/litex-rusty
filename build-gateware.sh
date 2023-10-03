#!/bin/bash
source /mnt/Coding/litex/bin/activate
rm -Rfd build/*
rm -Rfd litex-pac_tmp/*
/mnt/Coding/litex/litex-boards/litex_boards/targets/radiona_ulx3s_custom.py --build --doc --cpu-type vexriscv --cpu-variant imac+debug --sys-clk-freq 40e6 --sdram-rate 1:2 --with-spi-sdcard --device LFE5U-85F --revision 2.0 --toolchain trellis --csr-svd build/ulx3s.svd --csr-json build/ulx3s.json --soc-csv build/ulx3s.csv
( cd litex-pac_tmp && svd2rust -i ../build/ulx3s.svd --target riscv && mv lib.rs src/ )
sphinx-build -M html build/radiona_ulx3s_custom/doc build/radiona_ulx3s_custom/_doc

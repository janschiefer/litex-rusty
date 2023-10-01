#!/bin/bash
source /mnt/Coding/litex/bin/activate
rm -Rfd build/*
rm -Rfd litex-pac_tmp/*
/mnt/Coding/litex/litex-boards/litex_boards/targets/radiona_ulx3s_custom.py --build --doc --cpu-type vexriscv --cpu-variant imac --sys-clk-freq 25e6  --with-spi-sdcard --device LFE5U-85F --revision 2.0 --toolchain trellis --csr-svd build/ulx3s.svd --csr-json build/ulx3s.json
( cd litex-pac_tmp && svd2rust -i ../build/ulx3s.svd --target riscv && mv lib.rs src/ )
sphinx-build -M html build/radiona_ulx3s_custom/doc build/radiona_ulx3s_custom/_doc

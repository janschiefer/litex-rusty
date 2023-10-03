PACKAGES=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata bios
PACKAGE_DIRS=/mnt/Coding/litex/litex/litex/soc/software/libc /mnt/Coding/litex/litex/litex/soc/software/libcompiler_rt /mnt/Coding/litex/litex/litex/soc/software/libbase /mnt/Coding/litex/litex/litex/soc/software/libfatfs /mnt/Coding/litex/litex/litex/soc/software/liblitespi /mnt/Coding/litex/litex/litex/soc/software/liblitedram /mnt/Coding/litex/litex/litex/soc/software/libliteeth /mnt/Coding/litex/litex/litex/soc/software/liblitesdcard /mnt/Coding/litex/litex/litex/soc/software/liblitesata /mnt/Coding/litex/litex/litex/soc/software/bios
LIBS=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata
TRIPLE=riscv64-unknown-elf
CPU=vexriscv
CPUFAMILY=riscv
CPUFLAGS=-march=rv32i2p0_mac   -mabi=ilp32 -D__vexriscv__
CPUENDIANNESS=little
CLANG=0
CPU_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/cores/cpu/vexriscv
SOC_DIRECTORY=/mnt/Coding/litex/litex/litex/soc
PICOLIBC_DIRECTORY=/mnt/Coding/litex/pythondata-software-picolibc/pythondata_software_picolibc/data
COMPILER_RT_DIRECTORY=/mnt/Coding/litex/pythondata-software-compiler_rt/pythondata_software_compiler_rt/data
export BUILDINC_DIRECTORY
BUILDINC_DIRECTORY=/home/jschiefer/Code/litex-rusty/litex-rusty-app/build/radiona_ulx3s_custom/software/include
LIBC_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/libc
LIBCOMPILER_RT_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/libcompiler_rt
LIBBASE_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/libbase
LIBFATFS_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/libfatfs
LIBLITESPI_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/liblitespi
LIBLITEDRAM_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/liblitedram
LIBLITEETH_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/libliteeth
LIBLITESDCARD_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/liblitesdcard
LIBLITESATA_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/liblitesata
BIOS_DIRECTORY=/mnt/Coding/litex/litex/litex/soc/software/bios
LTO=0
BIOS_CONSOLE_FULL=1
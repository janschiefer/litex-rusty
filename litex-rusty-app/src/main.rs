#![no_std]
#![no_main]

use embedded_hal;
use embedded_hal::blocking::delay::DelayMs;
use embedded_hal::blocking::serial::Write;
use embedded_hal::digital::v2::{OutputPin, ToggleableOutputPin};
use nb;
use riscv;

extern crate panic_halt;
use litex_hal as hal;
use litex_pac as pac;
use riscv_rt::entry;

hal::uart! {
    UART: pac::UART,
}

// This is the entry point for the application.
// It is not allowed to return.
#[entry]
fn main() -> ! {
    let peripherals = pac::Peripherals::take().unwrap();

    let mut serial = UART {
        registers: peripherals.UART,
    };

    serial.bwrite_all(b"Hello world!\n").unwrap();

    loop {}
}

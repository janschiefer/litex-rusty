#![no_std]
#![no_main]

use embedded_hal;
use embedded_hal::blocking::delay::DelayMs;
use embedded_hal::blocking::serial::Write;
use embedded_hal::digital::v2::ToggleableOutputPin;
use riscv;

extern crate panic_halt;
use litex_hal as hal;
use litex_pac as pac;
use riscv_rt::entry;

macro_rules! gpio {
    ($(
        $GPIOX:ident: $PACGPIOX:ty,
    )+) => {
        $(
            #[derive(Debug)]
            pub struct $GPIOX {
                pub index: usize,
            }

            impl $GPIOX {
                pub fn new(index: usize) -> Self {
                    Self { index }
                }
            }

            impl embedded_hal::digital::v2::OutputPin for $GPIOX {
                type Error = core::convert::Infallible;

                fn set_low(&mut self) -> Result<(), Self::Error> {
                    let reg = unsafe { &*<$PACGPIOX>::ptr() };
                    let mask: u32 = !(1 << self.index);
                    riscv::interrupt::free(|| {
                        let val: u32 = reg.out.read().bits() & mask;
                        unsafe {
                            reg.out.write(|w| w.bits(val));
                        }
                    });
                    Ok(())
                }
                fn set_high(&mut self) -> Result<(), Self::Error> {
                    let reg = unsafe { &*<$PACGPIOX>::ptr() };
                    let mask: u32 = 1 << self.index;
                    riscv::interrupt::free(|| {
                        let val: u32 = reg.out.read().bits() | mask;
                        unsafe {
                            reg.out.write(|w| w.bits(val));
                        }
                    });
                    Ok(())
                }
            }

            impl embedded_hal::digital::v2::StatefulOutputPin for $GPIOX {
                fn is_set_low(&self) -> Result<bool, Self::Error> {
                    let reg = unsafe { &*<$PACGPIOX>::ptr() };
                    let mask: u32 = 1 << self.index;
                    let val: u32 = reg.out.read().bits() & mask;
                    Ok(val == 0)
                }
                fn is_set_high(&self) -> Result<bool, Self::Error> {
                    let reg = unsafe { &*<$PACGPIOX>::ptr() };
                    let mask: u32 = 1 << self.index;
                    let val: u32 = reg.out.read().bits() & mask;
                    Ok(val != 0)
                }
            }

            /// Opt-in to the software implementation.
            impl embedded_hal::digital::v2::toggleable::Default for $GPIOX {}
        )+
    }
}

hal::uart! {
    UART: pac::UART,
}

hal::timer! {
    TIMER: pac::TIMER0,
}

gpio! {
    LEDS: pac::LEDS,
}

// This is the entry point for the application.
// It is not allowed to return.
#[entry]
fn main() -> ! {
    let peripherals = pac::Peripherals::take().unwrap();

    let mut serial = UART {
        registers: peripherals.UART,
    };

    let mut delay = TIMER {
        registers: peripherals.TIMER0,
        sys_clk: 40_000_000,
    };

    loop {
        serial.bwrite_all(b"Hello world!\n").unwrap();

        for i in 0..8 {
            LEDS { index: i }.toggle().unwrap();
        }

        delay.delay_ms(1000 as u32);
    }
}

#!/bin/sh

openocd -f interface/ftdi/olimex-arm-usb-tiny-h.cfg -f interface/ftdi/olimex-arm-jtag-swd.cfg -f target/lpc11xx.cfg -c init -c "adapter_khz 1000"

#openocd -s ./openocd -f lpc1114_board.cfg


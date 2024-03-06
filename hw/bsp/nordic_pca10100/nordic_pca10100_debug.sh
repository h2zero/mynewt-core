#!/bin/sh

# This script attaches a gdb session to a Mynewt image running on your BSP.

# If your BSP uses JLink, a good example script to copy is:
#     repos/apache-mynewt-core/hw/bsp/nrf52dk/nrf52dk_debug.sh
#
# If your BSP uses OpenOCD, a good example script to copy is:
#     repos/apache-mynewt-core/hw/bsp/rb-nano2/rb-nano2_debug.sh

. $CORE_PATH/hw/scripts/jlink.sh

FILE_NAME=$BIN_BASENAME.elf

if [ $# -gt 2 ]; then
    SPLIT_ELF_NAME=$3.elf
    # TODO -- this magic number 0x42000 is the location of the second image
    # slot. we should either get this from a flash map file or somehow learn
    # this from the image itself
    EXTRA_GDB_CMDS="add-symbol-file $SPLIT_ELF_NAME 0x8000 -readnow"
fi

JLINK_DEV="nRF52833_xxAA"

jlink_debug
#!/bin/sh

# This script uploads a Mynewt image to your BSP.

# If your BSP uses JLink, a good example script to copy is:
#     repos/apache-mynewt-core/hw/bsp/nrf52dk/nrf52dk_download.sh
#
# If your BSP uses OpenOCD, a good example script to copy is:
#     repos/apache-mynewt-core/hw/bsp/rb-nano2/rb-nano2_download.sh

. $CORE_PATH/hw/scripts/jlink.sh

if [ "$MFG_IMAGE" ]; then
    FLASH_OFFSET=0x0
fi

JLINK_DEV="nRF52833_xxAA"

common_file_to_load
jlink_load
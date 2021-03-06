## Local build configuration
## Parameters configured here will override default and ENV values.
## Uncomment and change examples:

#Add your source directories here separated by space
MODULES = app

## ESP_HOME sets the path where ESP tools and SDK are located.
ESP_HOME ?= /opt/esp-open-sdk

## SMING_HOME sets the path where Sming framework is located.
SMING_HOME = ${PWD}/tools/Sming

## COM port parameter is reqruied to flash firmware correctly.
# COM_PORT = /dev/tty.usbserial
# COM_SPEED	= 115200

#### overridable rBoot options ####
## use rboot build mode
RBOOT_ENABLED ?= 1
## enable big flash support (for multiple roms, each in separate 1mb block of flash)
RBOOT_BIG_FLASH ?= 1
## two rom mode (where two roms sit in the same 1mb block of flash)
#RBOOT_TWO_ROMS  ?= 1
## size of the flash chip
SPI_SIZE        ?= 4M
## output file for first rom (.bin will be appended)
#RBOOT_ROM_0     ?= rom0
## input linker file for first rom
#RBOOT_LD_0      ?= rom0.ld
## these next options only needed when using two rom mode
#RBOOT_ROM_1     ?= rom1
#RBOOT_LD_1      ?= rom1.ld
## Location of the spiffs filesystem
SPIFF_FILES ?= spiffs
## size of the spiffs to create
SPIFF_SIZE      ?= 262144
## option to completely disable spiffs
#DISABLE_SPIFFS  = 1
## flash offsets for spiffs, set if using two rom mode or not on a 4mb flash
## (spiffs location defaults to the mb after the rom slot on 4mb flash)
#RBOOT_SPIFFS_0  ?= 0x100000
#RBOOT_SPIFFS_1  ?= 0x300000
## esptool2 path
ESPTOOL2        = ${PWD}/tools/esptool2/esptool2


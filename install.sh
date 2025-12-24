#!/bin/env bash
set -xe

DRV_C=HDD-01.qcow2
BOOT=c

#DRV_A=win98se-boot-diskete.img
DRV_A=fda.img
BOOT=a

#DRV_D=win95-se25-plus.iso
DRV_D=cd.iso

NET=N

echo '===  34698-OEM-0039682-72135 ==='

source ./_qemu_common.sh

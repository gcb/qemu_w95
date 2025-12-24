#!/bin/env bash
set -xe

DRV_C=HDD-01.qcow2
BOOT=c

#$DRV_A=install_w95/patcher9x-0.8.50-boot.ima
#DRV_A=install_w95/win98se-boot-diskete.img
#BOOT=a

#DRV_D=softgpu-0.6.2024.40.iso
#DRV_D=install_w95/win95-se25-plus.iso
#DRV_D=cd2.iso
#DRV_D=cd2.iso
#DRV_D=cdvbe.iso
#DRV_D=cdac.iso
DRV_D=cdqfg15.iso
#DRV_D=Cirrus_CLGD_5446_PCI_Drivers.iso
#DRV_D=rarkani1/cd/Realms1_BoD_ST.img
#DRV_D=cdroa1.iso

# games normally need 2 CD.
#DRV_E=cd.iso

NET=N

source ./_qemu_common.sh

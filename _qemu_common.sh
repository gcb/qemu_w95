#!/bin/env bash

# usage: define the vars bellow and source this file.

#BOOT=c
#DRV_A=install_w95/patcher9x-0.8.50-boot.ima
#DRV_C=HDD-01.qcow2
#DRV_D=softgpu-0.6.2024.40.iso
#DRV_E=cd2.iso
#NET=Y

if [[ "${BOOT}" == "" ]]; then
	echo "Missing BOOT=[abcde]" >&2
	exit 2
fi
#if [[ "${DRV_A}${DRV_C}${DRV_D}${DRV_E}" == "" ]]; then
if [[ "${DRV_C}" == "" ]]; then
	echo "Missing DRV_[ACDE]." >&2
	exit 2
fi
if [[ "${NET}" == "" ]]; then
	echo "Missing NET=[YN]." >&2
	exit 2
fi

set +x

QEMUOPT=(
	-M 'pc,acpi=off'
	-m 64
	-cpu pentium
	-rtc base=localtime
	-smp 1
	-accel 'tcg,thread=single'
	-vga cirrus
	-device sb16
	-device adlib
	-drive 'file='"$DRV_C"',index=0,media=disk'
	-boot "$BOOT"
)
	#-device gus,irq=5,dma=3,iobase=220
	#-device sb16,irq=5,dma=1,dma16=5,iobase=220
# sb16 options: NA PRATICA, o win achou: dma7,dma16=3, io=260, irq=9
#   audiodev=<str>         - ID of an audiodev to use as a backend
#   dma16=<uint32>         -  (default: 5)
#   dma=<uint32>           -  (default: 1)
#   iobase=<uint32>        -  (default: 544)
#   irq=<uint32>           -  (default: 5)
#   version=<uint32>       -  (default: 1029)
# 
# gus options:
#   audiodev=<str>         - ID of an audiodev to use as a backend
#   dma=<uint32>           -  (default: 3)
#   freq=<uint32>          -  (default: 44100)
#   iobase=<uint32>        -  (default: 576)
#   irq=<uint32>           -  (default: 7)

if [[ -n $DRV_A ]]; then
	echo "++ DRIVE A:"
	QEMUOPT+=(
		-drive 'file='"$DRV_A"',format=raw,index=0,if=floppy'
	)
fi
if [[ -n $DRV_D ]]; then
	echo "++ CD-ROM D:"
	QEMUOPT+=(
		-drive 'file='"$DRV_D"',index=1,media=cdrom'
	)
fi
if [[ -n $DRV_E ]]; then
	echo "++ CD-ROM E:"
	QEMUOPT+=(
		-drive 'file='"$DRV_E"',index=2,media=cdrom'
	)
fi
if [[ "${NET}" == "Y" ]]; then
	echo "++ NETWORKING"
	QEMUOPT+=(
		-netdev 'user,id=mynet0'
		-device 'ne2k_isa,netdev=mynet0'
	)
else
	QEMUOPT+=(
		-net none
	)
fi

qemu-system-i386 "${QEMUOPT[@]}"




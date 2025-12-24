best options to run win95 in qemu, for compatibility.

use one HDD-xx.qcow2 for each game or so.

then create one start-xx.sh for each game. See `start.sh` as an example.

TODO: ACPI.

see note on https://forums.virtualbox.org/viewtopic.php?t=9918
"run setup.exe /p j"

## WIN95 patch

READ https://github.com/JHRobotics/patcher9x?tab=readme-ov-file#patch-for-windows-9598-to-fix-cpu-speed-limit-bug

needed after a fresh install. Just boot with the floppy and patch it.

`DRV_A=patcher9x-0.8.50-boot.ima`

```
C:\> A:
A:\> patch9x
```

## display
- to run DX whatever you might need https://github.com/JHRobotics/softgpu
- to just have colors and high rez https://gunkies.org/wiki/Installing_Windows_95_on_Qemu
   - https://archive.org/download/windows-95a-on-qemu_additonal_drivers/VBE9X.zip


## create random CD to pass in data
sounds convoluted, but it's much less pain than the alternatives.

```
mkdir cd99
cd cd99
cp /all-files .
mkisofs -J -r -o ../cd99.iso .
```

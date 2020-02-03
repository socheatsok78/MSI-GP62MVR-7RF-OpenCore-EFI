### :warning: Use at your own risk!

# MSI GP62MVR 7RF OpenCore EFI
- Processor: 7th Gen. `Intel® Core™ i7 Kabylake` processor
  Processor Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz, 2801 Mhz, 4 Core(s), 8 Logical Processor(s)
- RAM: `DDR4-2400`
- Videocard 1: `GeForce® GTX 1060`, VRAM 6gb
- Videocard 2: `Intel HD Graphics 630` 1536MB
- Audio: `ALC899`
- Touchpad: Synaptics SMbus Touchpad

## BIOS Settings
- [BIOS Settings for KabyLake](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/intel-config.plist/kaby-lake#intel-bios-settings)

## EFI
### Drivers
- `FwRuntimeServices.efi`, OpenCore built-in EFI driver
- [AppleSupportPkg](https://github.com/acidanthera/AppleSupportPkg)
  - ApfsDriverLoader.efi
  - VBoxHfs.efi

### Tools
- [Shell.efi](https://github.com/acidanthera/OpenCoreShell)

### Kexts
- [Lilu.kext](https://github.com/acidanthera/Lilu)
- [LiluFriend.kext](https://github.com/PMheart/LiluFriend)
- [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen)
- [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC)
  - VirtualSMC.kext
  - SMCBatteryManager.kext (w\ VirtualSMC)
  - SMCProcessor.kext (w\ VirtualSMC)
  - SMCSuperIO.kext (w\ VirtualSMC)
- [AppleALC.kext](https://github.com/acidanthera/AppleALC)
- [AtherosE2200Ethernet.kext](https://github.com/Mieze/AtherosE2200Ethernet)
- [NoTouchID.kext](https://github.com/al3xtjames/NoTouchID)
- [VoodooInput.kext](https://github.com/acidanthera/VoodooInput)
- [VoodooPS2Controller.kext](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)
- [USBInjectAll.kext](https://bitbucket.org/RehabMan/os-x-usb-inject-all/downloads/)
  - [XHCI-unsupported.kext](https://github.com/RehabMan/OS-X-USB-Inject-All)
- [AppleMCEReporterDisabler.kext](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip)

## [config.plist](EFI/OC/config.plist)
The following settings is already in `EFI/OC/config.plist`.

#### Audio
```
PciRoot(0x0)/Pci(0x1f,0x3)
- layout-id: 06200000

// or...

7C436110-AB2A-4BBB-A880-FE41995C9F82
- boot-args: alcid=98
```

#### Nvidia GTX 1060 Graphic [Disabled]
```
7C436110-AB2A-4BBB-A880-FE41995C9F82
- boot-args: -wegnoegpu
```

## :construction: Not-Working
- Battery (Battery is not detected by system)
- Touchpad `Working` but not showing in `System Preferences` -> `Trackpad`

## Troubleshooting
### Internal Hard-disk not detected as `UEFI` boot partition:
Use the `Shell.efi` to boot into `UEFI Shell`, then run the following command:
```shell
bcfg boot dump
```
This command will output result of your BIOS boot partitiions. If the result is empty you need to add a new Boot record.

First, run `map` to find your `MacOS` installation drive. Take note on the `FS*` drive letter. eg. `FS4`.

To add a new Boot record, run the following command:
```shell
bcfg boot add id FS*:\EFI\BOOT\BOOTx64.efi AppleUEFI
```

> Note: `id` is index of your Boot record, you can use `00` if `bcfg boot dump` return empty

## References
- [Opencore Vanilla Desktop Guide](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/)
- [Clover Vanilla Laptop Guide](https://fewtarius.gitbook.io/laptopguide/)
- [Tonymacx86 - MSI GF62VR 7RF, High Sierra 10.13](https://www.tonymacx86.com/threads/guide-msi-gf62vr-7rf-high-sierra-10-13-2.241725/)

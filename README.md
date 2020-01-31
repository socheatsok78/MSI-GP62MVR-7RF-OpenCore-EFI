# MSI GP62MVR 7RF OpenCore EFI
- Videocard 1: `GeForce® GTX 1060`, VRAM 6gb
- Videocard 2: `Intel HD Graphics 630` 1536MB
- RAM: `DDR4-2400`
- Audio: `ALC899`
- Processor: 7th Gen. `Intel® Core™ i7 Kabylake` processor  
  Processor Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz, 2801 Mhz, 4 Core(s), 8 Logical Processor(s)
  
## BIOS Settings
- [BIOS Settings for KabyLake](https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/intel-config.plist/kaby-lake#intel-bios-settings)

## EFI Drivers
- [AppleSupportPkg](https://github.com/acidanthera/AppleSupportPkg)
  - ApfsDriverLoader.efi
  - VBoxHfs.efi

## Kexts
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC)
  - VirtualSMC.kext
  - SMCBatteryManager.kext
  - SMCProcessor.kext
- [Lilu.kext](https://github.com/acidanthera/Lilu)
- [LiluFriend.kext](https://github.com/PMheart/LiluFriend)
- [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen)
- [AppleALC.kext](https://github.com/acidanthera/AppleALC)
- [AtherosE2200Ethernet.kext](https://github.com/Mieze/AtherosE2200Ethernet)
- [USBInjectAll.kext](https://bitbucket.org/RehabMan/os-x-usb-inject-all/downloads/)
  - [XHCI-unsupported.kext](https://github.com/RehabMan/OS-X-USB-Inject-All)
- [AppleMCEReporterDisabler.kext](https://github.com/acidanthera/bugtracker/files/3703498/AppleMCEReporterDisabler.kext.zip)

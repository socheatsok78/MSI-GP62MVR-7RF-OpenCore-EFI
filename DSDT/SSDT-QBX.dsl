DefinitionBlock ("", "SSDT", 2, "hack", "_QBX", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Method (_SB.PCI0.LPCB.EC._QB7, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        If (_OSI ("Darwin"))
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
        }
    }

    Method (_SB.PCI0.LPCB.EC._QB8, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        If (_OSI ("Darwin"))
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
        }
    }
}

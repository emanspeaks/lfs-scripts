try make mrproper
try make defconfig
exit 0 #for debugging

#things that need kernel support
#iptables
#  network supt > network opts > network packet filtering (netfilter)
#nfsutils
#  file systems > network file systems > nfs client/server supt
#mdadm
#  device drv > mdadm
#							> raid supt
#							> autodetect raid arrays during boot
#							> raid10
# Device Drivers  --->
#	 Generic Driver Options  --->
#		 [ ] Support for uevent helper [CONFIG_UEVENT_HELPER]
#		 [*] Maintain a devtmpfs filesystem to mount at /dev [CONFIG_DEVTMPFS]

# 00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM Controller (rev 06)
        # Subsystem: Super Micro Computer Inc 4th Gen Core Processor DRAM Controller
        # Flags: bus master, fast devsel, latency 0
        # Capabilities: <access denied>
        # Kernel driver in use: hsw_uncore

# 00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI (rev 05) (prog-if 30 [XHCI])
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB xHCI
        # Flags: bus master, medium devsel, latency 0, IRQ 24
        # Memory at f7220000 (64-bit, non-prefetchable) [size=64K]
        # Capabilities: <access denied>
        # Kernel driver in use: xhci_hcd
        # Kernel modules: xhci_pci

# 00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 (rev 04)
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family MEI Controller
        # Flags: bus master, fast devsel, latency 0, IRQ 11
        # Memory at f7238000 (64-bit, non-prefetchable) [size=16]
        # Capabilities: <access denied>
        # Kernel modules: mei_me

# 00:16.1 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #2 (rev 04)
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family MEI Controller
        # Flags: bus master, fast devsel, latency 0, IRQ 10
        # Memory at f7237000 (64-bit, non-prefetchable) [size=16]
        # Capabilities: <access denied>

# 00:19.0 Ethernet controller: Intel Corporation Ethernet Connection I217-LM (rev 05)
        # DeviceName:  Intel Ethernet i217LM #2
        # Subsystem: Super Micro Computer Inc Ethernet Connection I217-LM
        # Flags: bus master, fast devsel, latency 0, IRQ 26
        # Memory at f7200000 (32-bit, non-prefetchable) [size=128K]
        # Memory at f7235000 (32-bit, non-prefetchable) [size=4K]
        # I/O ports at f020 [size=32]
        # Capabilities: <access denied>
        # Kernel driver in use: e1000e
        # Kernel modules: e1000e

# 00:1a.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #2 (rev 05) (prog-if 20 [EHCI])
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB EHCI
        # Flags: bus master, medium devsel, latency 0, IRQ 16
        # Memory at f7234000 (32-bit, non-prefetchable) [size=1K]
        # Capabilities: <access denied>
        # Kernel driver in use: ehci-pci
        # Kernel modules: ehci_pci

# 00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 (rev d5) (prog-if 00 [Normal decode])
        # Flags: bus master, fast devsel, latency 0, IRQ 16
        # Bus: primary=00, secondary=01, subordinate=02, sec-latency=0
        # I/O behind bridge: 0000e000-0000efff
        # Memory behind bridge: f6000000-f70fffff
        # Capabilities: <access denied>
        # Kernel driver in use: pcieport

# 00:1c.1 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #2 (rev d5) (prog-if 00 [Normal decode])
        # Flags: bus master, fast devsel, latency 0, IRQ 17
        # Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
        # I/O behind bridge: 0000d000-0000dfff
        # Memory behind bridge: f7100000-f71fffff
        # Capabilities: <access denied>
        # Kernel driver in use: pcieport

# 00:1d.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #1 (rev 05) (prog-if 20 [EHCI])
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family USB EHCI
        # Flags: bus master, medium devsel, latency 0, IRQ 22
        # Memory at f7233000 (32-bit, non-prefetchable) [size=1K]
        # Capabilities: <access denied>
        # Kernel driver in use: ehci-pci
        # Kernel modules: ehci_pci

# 00:1f.0 ISA bridge: Intel Corporation C224 Series Chipset Family Server Standard SKU LPC Controller (rev 05)
        # Subsystem: Super Micro Computer Inc C224 Series Chipset Family Server Standard SKU LPC Controller
        # Flags: bus master, medium devsel, latency 0
        # Capabilities: <access denied>
        # Kernel driver in use: lpc_ich
        # Kernel modules: lpc_ich

# 00:1f.2 RAID bus controller: Intel Corporation C600/X79 series chipset SATA RAID Controller (rev 05)
        # Subsystem: Super Micro Computer Inc C600/X79 series chipset SATA RAID Controller
        # Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 25
        # I/O ports at f070 [size=8]
        # I/O ports at f060 [size=4]
        # I/O ports at f050 [size=8]
        # I/O ports at f040 [size=4]
        # I/O ports at f000 [size=32]
        # Memory at f7232000 (32-bit, non-prefetchable) [size=2K]
        # Capabilities: <access denied>
        # Kernel driver in use: ahci
        # Kernel modules: ahci

# 00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller (rev 05)
        # Subsystem: Super Micro Computer Inc 8 Series/C220 Series Chipset Family SMBus Controller
        # Flags: medium devsel, IRQ 18
        # Memory at f7231000 (64-bit, non-prefetchable) [size=256]
        # I/O ports at 0580 [size=32]
        # Kernel driver in use: i801_smbus
        # Kernel modules: i2c_i801

# 00:1f.6 Signal processing controller: Intel Corporation 8 Series Chipset Family Thermal Management Controller (rev 05)
        # Subsystem: Super Micro Computer Inc 8 Series Chipset Family Thermal Management Controller
        # Flags: bus master, fast devsel, latency 0, IRQ 5
        # Memory at f7230000 (64-bit, non-prefetchable) [size=4K]
        # Capabilities: <access denied>

# 01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 03) (prog-if 00 [Normal decode])
        # Flags: bus master, fast devsel, latency 0
        # Bus: primary=01, secondary=02, subordinate=02, sec-latency=0
        # I/O behind bridge: 0000e000-0000efff
        # Memory behind bridge: f6000000-f70fffff
        # Capabilities: <access denied>

# 02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30) (prog-if 00 [VGA controller])
        # DeviceName:  ASPEED Video AST2400
        # Subsystem: Super Micro Computer Inc ASPEED Graphics Family
        # Flags: bus master, medium devsel, latency 0, IRQ 16
        # Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        # Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
        # I/O ports at e000 [size=128]
        # Expansion ROM at <unassigned> [disabled]
        # Capabilities: <access denied>
        # Kernel driver in use: ast
        # Kernel modules: ast

# 03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connection (rev 03)
        # DeviceName:  Intel Ethernet i210AT #1
        # Subsystem: Super Micro Computer Inc I210 Gigabit Network Connection
        # Flags: bus master, fast devsel, latency 0, IRQ 17
        # Memory at f7100000 (32-bit, non-prefetchable) [size=512K]
        # I/O ports at d000 [size=32]
        # Memory at f7180000 (32-bit, non-prefetchable) [size=16K]
        # Capabilities: <access denied>
        # Kernel driver in use: igb
        # Kernel modules: igb

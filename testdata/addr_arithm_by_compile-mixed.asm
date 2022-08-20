"".addr_arithm STEXT nosplit size=8 args=0x10 locals=0x0 funcid=0x0 align=0x0

;*** addr_arithm.go#13   >func addr_arithm(base *int32, idx int) int{
0x0000 00000 TEXT	"".addr_arithm(SB), NOSPLIT|ABIInternal, $0-16
0x0000 00000 FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
0x0000 00000 FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
0x0000 00000 FUNCDATA	$5, "".addr_arithm.arginfo1(SB)
0x0000 00000 FUNCDATA	$6, "".addr_arithm.argliveinfo(SB)
0x0000 00000 PCDATA	$3, $1

;*** addr_arithm.go#16   >    return *(*int)(unsafe.Pointer(uintptr(start) + size*uintptr(idx)))
0x0000 00000 LEAQ	(AX)(BX*4), CX
0x0004 00004 MOVQ	(CX), AX
0x0007 00007 RET
	0x0000 48 8d 0c 98 48 8b 01 c3                          H...H...
go.cuinfo.packagename. SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
""..inittask SNOPTRDATA size=24
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00                          ........
type..importpath.unsafe. SRODATA dupok size=8
	0x0000 00 06 75 6e 73 61 66 65                          ..unsafe
gclocals·1a65e721a2ccc325b382662e7ffee780 SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals·69c1753bd5f81501d95132d08af04464 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
"".addr_arithm.arginfo1 SRODATA static dupok size=5
	0x0000 00 08 08 08 ff                                   .....
"".addr_arithm.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..

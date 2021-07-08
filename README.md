# gomixedasm
Utility to generate mixed source and assembly list

Usage:

```sh
go build -o o.exe
func=$1
go tool objdump -s "$func" o.exe | gomixedasm  > $func.asm
```

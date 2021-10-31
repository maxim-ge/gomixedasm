# gomixedasm
Utility to generate mixed source and assembly list

## Installation:

go install github.com/maxim-ge/gomixedasm@latest

## Usage

```sh
go build -o o.exe
func=$1
go tool objdump -s "$func" o.exe | gomixedasm  > $func.asm
```

# gomixedasm

Utility to generate mixed source and assembly list

## Installation:

- go install github.com/maxim-ge/gomixedasm/gomixedasm@latest
- You might want to revove %GOPATH%/bin/gomixedasm.exe manually

## Usage

```sh
go build -o o.exe
func=$1
go tool objdump -s "$func" o.exe | gomixedasm  > $func.asm
```

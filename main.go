/*
 * Copyright (c) 2020 Maxim Geraskin. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */


package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
	"regexp"
	"strconv"
	"path/filepath"
)

func readLines(path string) ([]string) {
    file, err := os.Open(path)
    if err != nil {
		panic(err)
    }
    defer file.Close()

    var lines []string
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }
    return lines
}

func main() {
    scanner := bufio.NewScanner(os.Stdin)

//TEXT main.addr_arithm(SB) E:/workspaces/cloud/inv-wasm/asm/addr_arithm.go
	var rText = regexp.MustCompile(`(?m)TEXT (.*?)\.([^\(]*?)\(.*?\) (.*)`)
//	callfunc.go:5		0x4bd340	65488b0c2528000000	mov rcx, qword ptr gs:[0x28]	
	var rAsm = regexp.MustCompile(`(?m)(?m)(?m)\s*([^:]*?):-?(\d*)\s*([^\s]*)\s*([^\s]*)\s*(\S.*)`)

	var lines []string
	var fileName string
	printedLine := -1

    for scanner.Scan() {
        str := scanner.Text()
		matches := rText.FindStringSubmatch(str)
		if len(matches) > 0 {
			//funcName := matches[2]
			fPath := matches[3]
			_, fileName = filepath.Split(fPath)
			lines = readLines(fPath)
			printedLine = -1
			fmt.Printf(";***** %v\n", matches[0])
			continue
		}		
		matches = rAsm.FindStringSubmatch(str)
		if len(matches) > 0 && len(matches[1]) > 0{
			asmFileName := matches[1]
			asmLine, err := strconv.Atoi(matches[2])
			if err != nil{
				continue
			}
			asmAddr := matches[3]
			asmBin  := matches[4]
			asmCode := matches[5]
			if fileName == asmFileName {
				if asmLine >= len(lines){
					continue
				}
				if asmLine != printedLine{
					fmt.Printf("\n;*** %s#%-4d >%s\n", fileName, asmLine, lines[asmLine-1])
					printedLine = asmLine
				}
				fmt.Printf("%-12s %-22s %s\n", asmAddr, asmBin, asmCode)
				continue
			}
			fmt.Printf("\n;*** %s.%d\n", asmFileName, asmLine)
			fmt.Printf("%-12s %-22s %s\n", asmAddr, asmBin, asmCode)
		}
    }

    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }
}
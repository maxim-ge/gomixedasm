/*
 * Copyright (c) 2020 Maxim Geraskin. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

package gomixedasm

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"regexp"
	"strconv"
)

/*
Resources:
- https://regex101.com/
- https://regexr.com/
*/

func Mix(r io.Reader, w io.Writer) {
	scanner := bufio.NewScanner(r)

	//TEXT main.addr_arithm(SB) E:/workspaces/cloud/inv-wasm/asm/addr_arithm.go
	var rTextObjdump = regexp.MustCompile(`TEXT (.*?)\.([^\(]*)\(.*?\) (.*)`)

	//	callfunc.go:5		0x4bd340	65488b0c2528000000	mov rcx, qword ptr gs:[0x28]
	var rAsmObjdump = regexp.MustCompile(`\s*([^:]*?):-?(\d*)\s*([^\s]*)\s*([^\s]*)\s*(\S.*)`)

	//	0x0000 00000 (bytewriter_test.go:42)	TEXT	"".newLongSql(SB), ABIInternal, $24-0
	// 0x0000
	// 00000
	// bytewriter_test.go
	// 42
	// TEXT`, `"".newLongSql, ABIInternal, $24-0`
	var rTextCompile = regexp.MustCompile(`\s(\w*)\s(\w*)\s\(([^:]*):([^\)]*)\)\s(.*)`)

	var textLines []string
	var textFileName string
	lastPrintedLineNo := -1
	lastPrintedFileName := ""

	var matches []string

	for scanner.Scan() {
		str := scanner.Text()

		//TEXT main.addr_arithm(SB) E:/workspaces/cloud/inv-wasm/asm/addr_arithm.go
		{
			matches = rTextObjdump.FindStringSubmatch(str)
			if len(matches) > 0 {
				//funcName := matches[2]
				fPath := matches[3]
				_, textFileName = filepath.Split(fPath)
				textLines = readLines(fPath)
				lastPrintedLineNo = -1
				fmt.Fprintf(w, ";***** %v\n", matches[0])
				continue
			}
		}

		//	0x0000 00000 (bytewriter_test.go:42)	TEXT	"".newLongSql(SB), ABIInternal, $24-0
		{
			matches = rTextCompile.FindStringSubmatch(str)
			if len(matches) > 0 {
				fPath := matches[3]
				_, textFileName = filepath.Split(fPath)
				textLines = readLines(fPath)
				lastPrintedLineNo = -1
				fmt.Fprintf(w, ";***** %v\n", matches[0])
				continue
			}
		}

		//	callfunc.go:5		0x4bd340	65488b0c2528000000	mov rcx, qword ptr gs:[0x28]
		{
			matches = rAsmObjdump.FindStringSubmatch(str)
			if len(matches) > 0 && len(matches[1]) > 0 {
				instructionFileName := matches[1]
				instructionLineNo, err := strconv.Atoi(matches[2])
				if err != nil {
					continue
				}
				asmAddr := matches[3]
				asmBin := matches[4]
				asmCode := matches[5]

				srcLine := ""
				if textFileName == instructionFileName && instructionLineNo < len(textLines) {
					srcLine = textLines[instructionLineNo-1]
				}
				if instructionFileName != lastPrintedFileName || instructionLineNo != lastPrintedLineNo {
					fmt.Fprintf(w, "\n;*** %s#%-4d >%s\n", instructionFileName, instructionLineNo, srcLine)
					lastPrintedFileName = instructionFileName
					lastPrintedLineNo = instructionLineNo
				}

				fmt.Fprintf(w, "%-12s %-22s %s\n", asmAddr, asmBin, asmCode)
				continue
			}
		}
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

func readLines(path string) []string {
	file, err := os.Open(path)
	if err != nil {
		return []string{}
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines
}

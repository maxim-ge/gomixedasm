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
	"regexp"
	"strconv"
)

/*
Regexp resources:
- https://regex101.com/
- https://regexr.com/
*/

func Mix(r io.Reader, w io.Writer) {
	scanner := bufio.NewScanner(r)

	//TEXT main.addr_arithm(SB) E:/workspaces/cloud/inv-wasm/asm/addr_arithm.go
	var rObjdumpText = regexp.MustCompile(`TEXT (.*?)\.([^\(]*)\(.*?\) (.*)`)

	//	callfunc.go:5		0x4bd340	65488b0c2528000000	mov rcx, qword ptr gs:[0x28]
	var rObjdumpInstr = regexp.MustCompile(`\s*([^:]*?):-?(\d*)\s*([^\s]*)\s*([^\s]*)\s*(\S.*)`)

	//	0x0000 00000 (bytewriter_test.go:42)	TEXT	"".newLongSql(SB), ABIInternal, $24-0
	// 0x0000 00000
	// bytewriter_test.go
	// 42
	// TEXT	"".newLongSql(SB), ABIInternal, $24-0
	var rCompileInstrOrText = regexp.MustCompile(`\s(\w*\s\w*)\s\(([^:]*)(?::([^\)]*))?\)\s(.*)`)

	filesLines := make(map[string][]string)
	lastPrintedLineNo := -1
	lastPrintedFilePath := ""

	var matches []string

	for scanner.Scan() {
		line := scanner.Text()

		// rCompileInstrOrText
		//	0x0000 00000 (bytewriter_test.go:42)	TEXT	"".newLongSql(SB), ABIInternal, $24-0
		{
			matches = rCompileInstrOrText.FindStringSubmatch(line)
			if len(matches) > 0 {
				instructionFilePath := matches[2]
				instructionLineNo, lineNoErr := strconv.Atoi(matches[3])

				asmAddr := matches[1]
				asmBody := matches[4]

				if lineNoErr == nil {
					fileLines := getFileLines(filesLines, instructionFilePath)
					srcLine := ""
					if instructionLineNo < len(fileLines) {
						srcLine = fileLines[instructionLineNo-1]
					}
					if instructionFilePath != lastPrintedFilePath || instructionLineNo != lastPrintedLineNo {
						fmt.Fprintf(w, "\n;*** %s#%-4d >%s\n", instructionFilePath, instructionLineNo, srcLine)
						lastPrintedFilePath = instructionFilePath
						lastPrintedLineNo = instructionLineNo
					}
				}

				fmt.Fprintf(w, "%v %v\n", asmAddr, asmBody)
				continue
			}
		}

		// rObjdumpText
		// TEXT main.addr_arithm(SB) E:/workspaces/cloud/inv-wasm/asm/addr_arithm.go
		{
			matches = rObjdumpText.FindStringSubmatch(line)
			if len(matches) > 0 {
				//funcName := matches[2]
				lastPrintedLineNo = -1
				fmt.Fprintf(w, ";***** %v\n", matches[0])
				continue
			}
		}

		// rObjdumpInstr
		//	callfunc.go:5		0x4bd340	65488b0c2528000000	mov rcx, qword ptr gs:[0x28]
		{
			matches = rObjdumpInstr.FindStringSubmatch(line)
			if len(matches) > 0 && len(matches[1]) > 0 {
				instructionFilePath := matches[1]
				instructionLineNo, err := strconv.Atoi(matches[2])
				if err != nil {
					instructionLineNo = 1
				}

				fileLines := getFileLines(filesLines, instructionFilePath)

				asmAddr := matches[3]
				asmBin := matches[4]
				asmCode := matches[5]

				srcLine := ""
				if instructionLineNo < len(fileLines) {
					srcLine = fileLines[instructionLineNo-1]
				}
				if instructionFilePath != lastPrintedFilePath || instructionLineNo != lastPrintedLineNo {
					fmt.Fprintf(w, "\n;*** %s#%-4d >%s\n", instructionFilePath, instructionLineNo, srcLine)
					lastPrintedFilePath = instructionFilePath
					lastPrintedLineNo = instructionLineNo
				}

				fmt.Fprintf(w, "%-12s %-22s %s\n", asmAddr, asmBin, asmCode)
				continue
			}
		}

		// Nothing matched
		{
			fmt.Fprintln(w, line)
			lastPrintedFilePath = ""
			lastPrintedLineNo = -1
		}
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

func getFileLines(filesLines map[string][]string, filePath string) (lines []string) {
	lines, ok := filesLines[filePath]
	if ok {
		return
	}
	lines = readLines(filePath)
	filesLines[filePath] = lines
	return
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

/*
 * Copyright (c) 2020 Maxim Geraskin. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

package gomixedasm

import (
	"bufio"
	_ "embed"
	"os"
	"strings"
	"testing"

	"github.com/stretchr/testify/require"
)

//go:embed testdata/addr_arithm.asm
var addr_arithm_asm string

//go:embed testdata/addr_arithm-mixed.asm
var addr_arithm_asm_mixed string

func TestMix_addr_arithm(t *testing.T) {
	require := require.New(t)

	os.Chdir("testdata")
	var r = bufio.NewReader(strings.NewReader(addr_arithm_asm))
	var w strings.Builder
	Mix(r, &w)

	require.Equal(addr_arithm_asm_mixed, w.String())
}

//go:embed testdata/addr_arithm_by_tool.asm
var addr_arithm_by_tool_asm string

func TestMix_addr_arithm_by_tool(t *testing.T) {
	// require := require.New(t)

	os.Chdir("testdata")
	var r = bufio.NewReader(strings.NewReader(addr_arithm_by_tool_asm))
	// var w strings.Builder
	Mix(r, os.Stdout)

	// require.Equal(addr_arithm_asm_mixed, w.String())
}

//go:embed testdata/strconv.Atoi.asm
var strconv_Atoi string

//go:embed testdata/strconv.Atoi-mixed.asm
var strconv_Atoi_mixed string

func TestMix_strconv_Atoi(t *testing.T) {
	require := require.New(t)

	os.Chdir("testdata")
	var r = bufio.NewReader(strings.NewReader(strconv_Atoi))
	var w strings.Builder
	Mix(r, &w)

	require.Equal(strconv_Atoi_mixed, w.String())
}

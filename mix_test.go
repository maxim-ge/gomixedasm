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

//go:embed testdata/addr_arithm_by_objdump.asm
var addr_arithm_by_objdump_asm string

//go:embed testdata/addr_arithm_by_objdump-mixed.asm
var addr_arithm_by_objdump_mixed_asm string

func TestMix_addr_arithm(t *testing.T) {
	require := require.New(t)

	os.Chdir("testdata")
	var r = bufio.NewReader(strings.NewReader(addr_arithm_by_objdump_asm))
	var w strings.Builder
	Mix(r, &w)

	require.Equal(addr_arithm_by_objdump_mixed_asm, w.String())
}

//go:embed testdata/addr_arithm_by_compile.asm
var addr_arithm_by_tool_asm string

//go:embed testdata/addr_arithm_by_compile-mixed.asm
var addr_arithm_by_tool_mixed_asm string

func TestMix_addr_arithm_by_compile(t *testing.T) {
	require := require.New(t)

	os.Chdir("testdata")
	var r = bufio.NewReader(strings.NewReader(addr_arithm_by_tool_asm))
	var w strings.Builder
	Mix(r, &w)

	require.Equal(addr_arithm_by_tool_mixed_asm, w.String())
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

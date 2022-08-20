/*
 * Copyright (c) 2020 Maxim Geraskin. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

package main

import (
	"os"

	"github.com/maxim-ge/gomixedasm"
)

func main() {
	gomixedasm.Mix(os.Stdin, os.Stdout)
}

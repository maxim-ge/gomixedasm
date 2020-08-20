/*
 * Copyright (c) 2020 Maxim Geraskin. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

package main

import "unsafe"

//go:noinline
func addr_arithm(base *int32, idx int) int{
    start := unsafe.Pointer(base)
    size := unsafe.Sizeof(int32(0))
    return *(*int)(unsafe.Pointer(uintptr(start) + size*uintptr(idx)))
}

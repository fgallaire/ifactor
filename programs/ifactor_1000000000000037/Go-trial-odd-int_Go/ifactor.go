// Copyright (C) 2016, Florent Gallaire <fgallaire@gmail.com>
// MIT license

package main

import "os"
import "fmt"
import "strings"
import "strconv"

func main() {
    N := os.Args[1]
    n, _ := strconv.Atoi(N)
    dk := 2
    p := []string{}
    for n > 1 {
        q := n / dk
        r := n % dk
        if r == 0 {
            p = append(p, strconv.Itoa(dk))
            n = q
        } else if q > dk {
            if dk == 2 {
                dk = 3
            } else {
                dk = dk + 2
            }
        } else {
            p = append(p, strconv.Itoa(n))
            break
        }        
    }
    fmt.Println(N + ": " + strings.Join(p, " "))
}

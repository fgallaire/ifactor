// Copyright (C) 2017, Florent Gallaire <fgallaire@gmail.com>
// MIT license

package main

import "os"
import "fmt"
import "strings"
import "math/big"

func main() {
    N := os.Args[1]
    n := big.NewInt(0)
    n.SetString(N, 10)
    dk := big.NewInt(2)
    q := big.NewInt(0)
    r := big.NewInt(0)
    p := []string{}
    zero := big.NewInt(0)
    one := big.NewInt(1)
    for n.Cmp(one) == 1 {
        q.DivMod(n, dk, r) 
        if r.Cmp(zero) == 0 {
            p = append(p, dk.String())
            n.Set(q)
        } else if q.Cmp(dk) == 1 {
            dk.Add(dk, one)
        } else {
            p = append(p, n.String())
            break
        }        
    }
    fmt.Println(N + ": " + strings.Join(p, " "))
}

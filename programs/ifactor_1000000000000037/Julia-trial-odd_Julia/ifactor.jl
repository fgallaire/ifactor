# Copyright (C) 2017, Florent Gallaire <fgallaire@gmail.com>
# MIT license

N = ARGS[1]
n = parse(BigInt, N)
dk = 2
p = []

while n > 1
    q, r = divrem(n, dk)
    if r == 0
        push!(p, dk)
        n = q
    elseif q > dk
        if dk == 2
            dk = 3
        else
            dk = dk + 2
        end
    else
        push!(p, n)
        break
    end
end

println(N * ": " * join(p, " "))

# Copyright (C) 2017, Florent Gallaire <fgallaire@gmail.com>
# MIT license

N = ARGS[1]
n = parse(BigInt, N)
d = 2:n
dk = start(d)
p = []

while n > 1
    q, r = divrem(n, dk)
    if r == 0
        push!(p, dk)
        n = q
    elseif q > dk
        i, dk = next(d, dk)
    else
        push!(p, n)
        break
    end
end

println(N * ": " * join(p, " "))

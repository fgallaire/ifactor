# Copyright (C) 2017, Florent Gallaire <fgallaire@gmail.com>
# MIT license

from sys import argv

N = argv[1]
n = int(N)
dk = 2
p = []

while n > 1:
    q, r = divmod(n, dk)
    if r == 0:
        p.append(dk)
        n = q
    elif q > dk:
        dk = dk + 1
    else:
        p.append(n)
        break

print(N + ': ' + ' '.join(str(i) for i in p))

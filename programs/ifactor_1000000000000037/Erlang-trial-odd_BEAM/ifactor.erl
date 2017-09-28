% Copyright (C) 2017, Florent Gallaire <fgallaire@gmail.com>
% MIT license

-module(ifactor).
-export([main/1]).

ifactor(N) when is_integer(N), N > 1 -> ifactor(N, N div 2, N rem 2, 2, []).
ifactor(N, Dk, P) when N > 1 -> ifactor(N, N div Dk, N rem Dk, Dk, P);
ifactor(_N, _Dk, P) -> lists:reverse(P).
ifactor(_N, Q, 0, Dk, P) -> ifactor(Q, Dk, [Dk|P]);
ifactor(N, Q, _R, 2, P) when Q > 2 -> ifactor(N, 3, P);
ifactor(N, Q, _R, Dk, P) when Q > Dk -> ifactor(N, Dk + 2, P);
ifactor(N, _Q, _R, _Dk, P) -> lists:reverse([N|P]).

main([String]) ->
    N = list_to_integer(String),
    P = ifactor(N),
    io:format("~w: ~s\n", [N, string:join([integer_to_list(I) || I <- P], " ")]),
    erlang:halt(0).

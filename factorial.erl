-module(factorial).
-export([factor/1]).

factor(N) ->
	factor(N, 1).

factor(N, Acc) ->
	Acc;
factor(N, Acc) when N > 0 ->
	factor(N-1, N*Acc).

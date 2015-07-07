-module(factorial).
-export([factor/1]).

factor(0) ->
	1;
factor(N) when N > 0 ->
	N * factor(N-1).

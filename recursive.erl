-module(recursive).
-export([factorial/1, len/1]).

%%Возвращает факториал числа
factorial(N) ->
	factorial(N, 1).

factorial(0, Acc) ->
	Acc;
factorial(N, Acc) when N > 0 ->
	factorial(N-1, N*Acc).

%%Возвращает длину списка
len([]) ->
	0;
len([_|T]) ->
	1 + len(T).

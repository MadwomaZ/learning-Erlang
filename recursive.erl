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
len(L) -> len(L,0).
	
len([], Acc) ->
	Acc;
len([_|T], Acc) ->
	len(T, Acc+1).

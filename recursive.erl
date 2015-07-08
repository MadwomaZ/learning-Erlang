-module(recursive).
-export([factorial/1, len/1, duplicate/2, sublist/2]).

%%Возвращает факториал числа
factorial(N) -> factorial(N, 1).

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

%%Возвращает Term в количестве N раз
duplicate(N, Term) -> duplicate(N, Term, []).

duplicate(0,_, List) ->
	List;
duplicate(N, Term, List) when N > 0 ->
	duplicate(N-1, Term, [Term|List]).

%%Возвращает N первых элементов списка
sublist(_, 0) -> [];
sublist([],_) -> [];
sublist([H|T], N) when N > 0 ->
	[H|sublist(T, N-1)].	

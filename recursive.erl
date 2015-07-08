-module(recursive).
-export([factorial/1, len/1, duplicate/2, sublist/2, zip/2, lzip/2]).

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
sublist(L, N) -> lists:reverse(sublist(L, N, [])).

sublist(_, 0, Sublist) -> Sublist;
sublist([],_, Sublist) -> Sublist;
sublist([H|T], N, Sublist) when N > 0 ->
	sublist(T, N-1, [H|Sublist]).	

%%Склееивание двух списков одинаковой длины
zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) ->
	[{X, Y}|zip(Xs, Ys)].

%%Склееивание двух списков разной длины
lzip([],_) -> [];
lzip(_,[]) -> [];
lzip([X|Xs],[Y|Ys]) ->
	[{X, Y}|lzip(Xs, Ys)].

-module(quicksort).
-export([qsort/1]).

%Быстрая сортировка с помощью генераторов списков
qsort([]) -> [];
qsort([Pivot|Rest]) ->
	qsort([Smaller || Smaller <- Rest, Smaller =< Pivot])
	++ [Pivot] ++
	qsort([Langer || Langer <- Rest, Langer > Pivot]).

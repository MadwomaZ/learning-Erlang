-module(hhfunc).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y(). %%агрументы в виде fun hhfunc:one/0

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

filter(Predic, L) -> lists:reverse(filter(Predic, L, [])).

filter(_, [], Acc) -> Acc;
filter(Predic, [H|T], Acc) -> 
	case Predic(H) of
		true  -> filter(Predic, T, [H|Acc]);
		false -> filter(Predic, T, Acc)
	end.

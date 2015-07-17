-module(calc).
-compile(export_all).

rpn(L) when is_list(L) ->
	[Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
	Res.

rpn("+", [N1,N2|S]) -> [N1+N2|S];
rpn("-", [N1,N2|S]) -> [N1-N2|S];
rpn("*", [N1,N2|S]) -> [N1*N2|S];
rpn("/", [N1,N2|S]) -> [N1/N2|S];
rpn("^", [N1,N2|S]) -> [math:pow(N2,N1)|S];
rpn("ln", [N|S]) -> [math:log(N)|S];
rpn("log10", [N|S]) -> [math:log10(N)|S];
rpn("sum", Stack)   -> [lists:sum(Stack)];
rpn("prod", Stack)  -> [lists:foldl(fun erlang:'*'/2, 1, Stack)];
rpn(X, Stack) -> [read(X)|Stack].

read(N) ->
	case string:to_float(N) of
		{error, no_float} -> list_to_integer(N);
		{F, _} -> F
	end.

rpn_test() ->
	5 = rpn("2 3 +"),
	-5 = rpn("8 3 -"),
	4 = rpn("10 4 3 + 2 * -"),
	0.5 = rpn("10 4 3 + 2 * - 2 /"),
	ok = try
		rpn("90 34 12 33 55 66 + * - +")
	catch
		error:{badmatch, [_|_]} -> ok
	end,
	3925 = rpn("90 34 12 33 55 66 + * - + -"),
	8.0 = rpn("2 3 ^"),
	true = math:sqrt(2) == rpn("2 0.5 ^"),
	true = math:log10(2.7) == rpn("2.7 log10"),
	true = math:log(2.7) == rpn("2.7 ln"),
	50 = rpn("10 10 10 20 sum"),
	0.1 = rpn("10 10 10 20 sum 5 /"),
	1000.0 = rpn("10 10 20 0.5 prod"),
	ok.

-module(exceptions).
-compile(export_all).

throws(F) ->
	try F() of
		_ -> ok
	catch
		Throw -> {throw, caught, Throw}
	end.

errors(F) ->
	try F() of
		_ -> ok
	catch
		error:Error -> {error, caught, Error}
	end.

exits(F) ->
	try F() of
		_ -> ok
	catch
		exit:Exit -> {exit, caught, Exit}
	end.

%%Монти Пайтон черный рыцарь
sword(1) -> throw(slice); %резать
sword(2) -> erlang:error(cut_arm); %рубить руку
sword(3) -> exit(cut_leg); %рубить ногу
sword(4) -> throw(punch); %ударить
sword(5) -> throw(slice). %перейти мост

black_knight(Attack) when is_function(Attack, 0) ->
	try Attack() of
		_             -> "Никто не пройдет!"
	catch
		throw:sliece  -> "Это просто царапина!";
		error:cut_arm -> "Бывало и похуже.";
		exit:cut_leg  -> "Ну давай, слабак!";
		_:_           -> "Это просто легкая рана."
	end.

talk() -> "Blah Blah".

whoa() ->
	try
		talk(),
		_Knight = "Nikto ne proidet!",
		_Doubles = [N*2 || N <- lists:seq(1, 100)],
		throw(up),
		_WillReturnThis = tequila
	of
		tequila -> "Worked!"
	catch
		Exception:Reason -> {caught, Exception, Reason}
	end.

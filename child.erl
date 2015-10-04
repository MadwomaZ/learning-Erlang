-module(child).
-compile(export_all).

child() ->
	receive
		{From, porridge} ->  %Дать кашу
			From ! "I do not want to porridge! I want chocolate!",
			child();
		{From, chocolate} -> %Дать шоколад
			From ! "Hooray, thanks for the chocolate!";
		_ -> 
			io:format("I have no time, I'm playing.~n"),
			child()
	end.

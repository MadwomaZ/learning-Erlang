-module(dolphins).
-compile(export_all).

dolphin() ->
	receive
		{From, do_a_flip} ->
			From ! "NO!!!",
			dolphin();
		{From, fish} ->
			From ! "All is well, and thanks for the fish!";
		_ ->
			io:format("Hah, we're smarter than you people.~n"),
			dolphin()
	end.

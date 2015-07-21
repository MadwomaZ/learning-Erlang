-module(dolphins).
-compile(export_all).

dolphin() ->
	receive
		do_a_flip ->
			io:format("NO!!! ~n");
		fish ->
			io:format("All is well, and thanks for the fish!~n");
		_ ->
			io:format("Hah, we're smarter than you people.~n");
	end.

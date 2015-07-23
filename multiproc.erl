-module(multiproc).
-compile(export_all).

sleep(T) ->
	receive
	after T -> ok
	end.

flush() ->
	receive
		_ -> flush()
	after 0 ->
		ok
	end.

important() ->
	receive
		{Priory, Msg} when Priory > 10 ->
			[Msg | important()]
	after 0 ->
		normal()
	end.

normal() ->
	receive
		{_, Msg} ->
			[Msg | normal()]
	after 0 ->
		[]
	end.

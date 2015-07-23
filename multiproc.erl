-module(multiproc).
-compile(export_all).

sleep(T) ->
	receive
	after T -> ok
	end.


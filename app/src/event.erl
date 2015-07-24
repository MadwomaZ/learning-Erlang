-module(event).
-compile(export_all). %заменить на export([])
-record( state, {server,
		 name = "",
		 to_go = 0}).

loop(S = #state{server=Server, to_go = [T|Next]}) ->
	receive
		{Server, Ref, cancel} ->
			Server ! {Ref, ok}
	after T*1000 ->
		if Next =:= [] ->
			Server ! {done, S#state.name};
		   Next =/= [] ->
			loop(S#state{to_go = Next})
		end
	end.

normalize(N) ->
	Limit = 49*24*60*60,
	[N rem Limit | lists:duplicate(N div Limit, Limit)].

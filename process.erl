-module(process).
-export([start/0, p/0, print/1, block/1, divblock/1, sortMsg/1]).
 
print(List) ->
	io:format("~p~n", [lists:sort(List)]).

block(L) -> 
	erlang:tuple_to_list(lists:split(erlang:length(L) div 2, L)).

start() ->
  spawn(process, p, []).
 
p() ->
  receive
    {Pid, Msg} when is_pid(Pid) ->
      io:format("Done proc: ~p, mesg: ~p~n", [Pid, Msg]),
      Pid ! Msg,
      p();
    stop ->
      ok;
    _ ->
      io:format("Unknown type of message~n", []),        
      p()
  end.

sortMsg(L) ->
	Sortlist =  self() ! lists:sort(L),
	io:format("~p~n", [Sortlist]).

divblock(L) ->
	Sr = (lists:min(L) + lists:max(L))/2,
	Lsmall = [X || X <- L, X =< Sr],
	Lbig = [X || X <- L, X >= Sr],
	Spwn = [sortMsg(X) || X <- [Lsmall, Lbig]],
	io:format("Spawn: ~p~n", [Spwn]).

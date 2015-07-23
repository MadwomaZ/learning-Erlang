-module(linkmon).
-compile(export_all).

myproc() ->
	timer:sleep(5000),
	exit(reason).

chain(0) ->
	receive
		_ -> ok
	after 2000 ->
		exit("chain breaks")
	end;
chain(N) ->
	Pid = spawn(fun() -> chain(N-1) end),
	link(Pid),
	receive
		_ -> ok
	end.

start_critic() ->
	spawn(?MODULE, critic, []).

juidge(Pid, Band, Album) ->
	Pid ! {self(), {Band, Album}},
	receive
		{Pid, Criticism} -> Criticism
	after 2000 ->
		timeout
	end.

critic() ->
	receive
		{From, {"Rage Against the Turning Machine", "Unit Testify"}} ->
			From ! {self(), "They are wonderful"};	
		{From, {"SOAD", "Memorize"}} ->
			From ! {self(), "Fantastic!"};
		{From, {_, _}} ->
			From ! {self(), "So-so"}
	end,
	critic().


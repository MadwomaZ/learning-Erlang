-module(linkmon).
-compile(export_all).

start_critic() ->
	spawn(?MODULE,restarter, []).

juidge(Band, Album) ->
	Ref = make_ref(),
	critic ! {self(), Ref, {Band, Album}},
	receive
		{Ref, Criticism} -> Criticism
	after 2000 ->
		timeout
	end.

critic() ->
	receive
		{From, Ref, {"Rage Against the Turning Machine", "Unit Testify"}} ->
			From ! {Ref, "They are wonderful"};	
		{From, Ref, {"SOAD", "Memorize"}} ->
			From ! {Ref, "Fantastic!"};
		{From, Ref, {_, _}} ->
			From ! {Ref, "So-so"}
	end,
	critic().

restarter() ->
	process_flag(trap_exit, true),
	Pid = spawn_link(?MODULE, critic, []),
	register(critic, Pid),
	receive
		{'EXIT', Pid, normal}   -> ok;
		{'EXIT', Pid, shutdown} -> ok;
		{'EXIT', Pid, _} -> restarter()
	end.

-module(linkmon).
-compile(export_all).

myproc() ->
	timer:sleep(5000),
	exit(reason).


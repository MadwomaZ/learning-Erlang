-module(event).
-compile(export_all). %заменить на export([])
-record( state, {server,
		 name = "",
		 to_do = 0}).



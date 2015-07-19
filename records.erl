-module(records).
-compile(export_all).

-record(robot, {name,
		type = industrial,
		hobbies,
		details = []}).

first_robot() ->
	#robot{name = "Mechatronic",
	       type = handmade,
	       details = ["It moves with the little man inside"]}.

car_factory(CorpName) ->
	#robot{name = CorpName, hobbies = "Build cars"}.

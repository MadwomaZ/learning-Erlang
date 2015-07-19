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

-record(user, {id, name, group, age}).

%%Используем сопоставление с образцом для отбора
admin_panel(#user{name = Name, group = admin}) ->
	Name ++ " is allowed!"; %Разрешено
admin_panel(#user{name = Name}) ->
	Name ++ " is not allowed". %Запрещено

%%Проверяем возраст
adult_section(U = #user{}) when U#user.age >= 18 ->
	%%Показать страницы для взрослых
	allowed;
adult_section(_) ->
	forbidden.

repairman(Rob) ->
	Details = Rob#robot.details,
	NewRob = Rob#robot{details = ["Renovated repairman"|Details]},
	{repaired, NewRob}.

-module(tree).
-compile(export_all).

empty() -> {node, 'nil'}.

insert(Key, Val, {node, 'nil'}) ->
	{node, {Key, Val, {node, 'nil'}, {node, 'nil'}}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Langer}})
	when NewKey < Key ->
	{node, {Key, Val, insert(NewKey, NewVal, Smaller), Langer}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Langer}})
	when NewKey > Key ->
	{node, {Key, Val, Smaller, insert(NewKey, NewVal, Langer)}};
insert(Key, Val, {node, {Key, _, Smaller, Langer}}) ->
	{node, {Key, Val, Smaller, Langer}}.

lookup(_, {node, 'nil'}) ->
	undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
	{ok, Val};
lookup(Key, {node, {NodeKey, _, Smaller, _}}) when Key < NodeKey ->
	lookup(Key, Smaller);
lookup(Key, {node, {_, _, _, langer}}) ->
	lookup(Key, langer).

%Ищет значение Val в дереве
has_val(Val, Tree) ->
	try has_value(Val, Tree) of
		false -> false
	catch
		true -> true
	end.

has_value(_, {node, 'nil'}) ->
	false;
has_value(Val, {node, {_, Val, _, _}}) ->
	throw(true);
has_value(Val, {node, {_,_, Left, Right}}) ->
	has_value(Val, Left),
	has_value(Val, Right).

-module(tree).
-export([empty/0, insert/3, lookup/2]).

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

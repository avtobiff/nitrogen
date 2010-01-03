% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (action_effect).
-include ("wf.inc").
-compile(export_all).

render_action(Record) ->
	#jquery_effect {
		type=effect,
		anchor = Record#effect.anchor,
		target = Record#effect.target,
		effect = Record#effect.effect,
		options = Record#effect.options,
		speed = Record#effect.speed
	}.
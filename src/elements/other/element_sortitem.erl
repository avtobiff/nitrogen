% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_sortitem).
-include ("wf.inc").
-compile(export_all).

reflect() -> record_info(fields, sortitem).

render_element(Record) -> 
	Anchor = Record#sortitem.anchor,
	PickledTag = wf:pickle(Record#sortitem.tag),
	Script = #script { 
		script=wf:f("Nitrogen.$sortitem('~s', '~s');", [Anchor, PickledTag])
	},
	wf:wire(Script),
	
	Panel = #panel {
		id=Record#sortitem.id,
		anchor=Record#sortitem.anchor,
		class=[sortitem, Record#sortitem.class],
		style=Record#sortitem.style,
		body=Record#sortitem.body
	},

	element_panel:render_element(Panel).
	
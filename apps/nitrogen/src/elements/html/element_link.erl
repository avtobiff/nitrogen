% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_link).
-include ("wf.inc").
-compile(export_all).

reflect() -> record_info(fields, link).

render_element(Record) -> 
	ID = Record#link.id,
	Anchor = Record#link.anchor,
	case Record#link.postback of
		undefined -> ignore;
		Postback -> wf:wire(Anchor, #event { type=click, postback=Postback, validation_group=ID, delegate=Record#link.delegate })
	end,
	
	Body = [
		wf:html_encode(Record#link.text, Record#link.html_encode),
		Record#link.body
	],
	
	wf_tags:emit_tag(a, Body, [
		{href, Record#link.url},
		{class, [link, Record#link.class]},
		{style, Record#link.style}
	]).
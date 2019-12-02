-module(client).
-export([send/2]).
send(Pid, Message)->
Pid!{self(), Message},
receive
	{From, Response}->
	io:format("Client ~p 	from ~p~n", 
	[Response, From])
after
	1000 -> die
end.

-module(server).
-export([start/0]).
start()->
spawn(
	fun() ->
	server() end
).
server()->
receive
{From, Message}->
	io:format("Server ~p from 	~p~n",
	[Message, From]),
	From!{self(),
	{"Server Received", Message}},
	server()
end.

defmodule Hub do
	
	def start() do
		{:ok, spawn(fn() -> init() end)}
	end

	def init() do
		:io.format("hub ~w: started~n", [self()])
		hub([])
	end

	def hub(connected) do
		receive do
			{:connect, pid} ->
				:io.format(
					"hub ~w: connecting to ~w~n", [self(), pid])
				ref = :erlang.monitor(:process, pid)
				hub([{ref, pid} | connected])

			{:disconnect, pid} ->
				:io.format(
					"hub ~w: disconnect ~w~n", [self(), pid])
				:erlang.demonitor(:process, pid)
				hub(List.keydelete(connected, pid, 1))

			{:DOWN, ref, :process, _, _} ->
				:io.format(
					"hub ~w: died ~w~n", [self(), ref])

			%Frame{} = frame ->
				Enum.each(connected, fn({_, pid}) -> send(pid, frame) end)
				hub(connected)

			:status ->
				:io.format(
					"hub ~w: connected ~w~n", [self(), connected])
				hub(connected)

			:quit ->
				:ok
		end
	end
	z
end
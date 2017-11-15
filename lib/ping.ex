defmodule Ping do
  def start do
    loop()
  end

  def loop do
    receive do
      {:pong, from} ->
        IO.puts " .. pong -> "
        :timer.sleep 250
        send(from, {:ping, self()})
      {:ping, from} ->
        IO.puts " <- ping .. "
        :timer.sleep 250
        send(from, {:pong, self()})
      {:pang, from} -> send(from, {:peng, self()})
    end
    loop()
  end

end

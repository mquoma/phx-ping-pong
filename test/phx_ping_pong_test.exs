defmodule PhxPingPongTest do
  use ExUnit.Case
  doctest PhxPingPong

  test "greets the world" do
    assert PhxPingPong.hello() == :world
  end

  test "it responds to a pong with a ping!" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}
  end

  test "it responds to a ping with a pong!" do
    ping = spawn(Ping, :start, [])
    send(ping, {:ping, self()})
    assert_receive {:pong, ^ping}
  end

  test "it responses to a pang with a peng?" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pang, self()})
    assert_receive {:peng, ^ping}
  end

  test "it can respond to TWO messages" do
    ping = spawn(Ping, :start, [])

    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}

    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}

  end
end

defmodule HttpMockPalTest do
  use ExUnit.Case
  use Plug.Test

  @main_router HttpMockPal.TestRouter
  @ping_router HttpMockPal.PingRouter

  test "calling ping returns pong!" do
    conn = conn(:get, "/ping")
    conn = @ping_router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "calling ping2 returns pong2!" do
    conn = conn(:get, "/test1")
    conn = @main_router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 201
    assert conn.resp_body == "test"
  end
end

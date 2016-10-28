defmodule HttpMockPal.Router.MainTest do
  use ExUnit.Case
  doctest HttpMockPal.Router.Main
  use Plug.Test

  @main_router HttpMockPal.Router.Main
  @opts @main_router.init([])

  test "calling ping returns pong!" do
    conn = conn(:get, "/__ping")
    conn = @main_router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "calling ping2 returns pong2!" do
    conn = conn(:get, "/test1")
    conn = @main_router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 201
    assert conn.resp_body == "test"
  end
end

defmodule HttpMockPal.PingRouter do
  @moduledoc false
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    conn
    |> send_resp(200, "pong")
  end
end

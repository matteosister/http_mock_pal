defmodule HttpMockPal.PingRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/ping" do
    conn
    |> send_resp(200, "pong")
  end
end

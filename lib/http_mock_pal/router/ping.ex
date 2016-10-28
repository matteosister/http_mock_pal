defmodule HttpMockPal.Router.Ping do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/__ping" do
    conn
    |> send_resp(200, "pong")
  end
end

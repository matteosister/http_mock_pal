defmodule HttpMockPal.TestRouter do
  @moduledoc false
  use Plug.Router

  plug :match
  plug :dispatch

  get "/test1" do
    conn
    |> send_resp(201, "test")
  end
end

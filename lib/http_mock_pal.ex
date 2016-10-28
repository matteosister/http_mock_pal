defmodule HttpMockPal do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, HttpMockPal.Router.Main, [], [port: server_port])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HttpMockPal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp server_port do
    Application.get_env(:http_mock_pal, :port) || 4001
  end
end

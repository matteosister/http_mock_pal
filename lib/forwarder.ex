defmodule HttpMockPal.Forwarder do
  defmacro __using__(_) do
    router = get_router
    unless is_nil(router) do
      quote bind_quoted: [router: router] do
        forward "/", to: router
      end
    end
  end

  def get_router do
    Application.get_env(:http_mock_pal, :router) || nil
  end
end

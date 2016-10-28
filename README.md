# Http Mock Pal

An elixir app to start up a mock server to act like external services you are
trying to test or mock.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `http_mock_pal` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:http_mock_pal, "~> 0.1", only: :test}]
    end
    ```

  2. Ensure `http_mock_pal` is started before your application:

    ```elixir
    def application do
      [applications: [:http_mock_pal]]
    end
    ```

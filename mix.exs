defmodule HttpMockPal.Mixfile do
  use Mix.Project

  def project do
    [
      app: :http_mock_pal,
      description: description(),
      package: package(),
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "http_mock_pal",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Matteo Giachino"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/matteosister/http_mock_pal"}
    ]
  end

  defp description(),
    do: "A convenience library to spawn plug router with your application for testing purposes"

  # Specifies which paths to compile per environment.
  defp elixirc_paths(env) when env in ~w(dev test)a, do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger], mod: {HttpMockPal, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0"}, {:plug, "~> 1.0"}, {:ex_doc, ">= 0.0.0", only: :dev}]
  end
end

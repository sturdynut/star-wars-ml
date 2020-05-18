defmodule StarWarsMl.MixProject do
  use Mix.Project

  def project do
    [
      app: :star_wars_ml,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {StarWarsMl.Application, []}
    ]
  end

  defp deps do
    [
      {:crawly, "~> 0.9.0"},
      {:httpoison, "~> 1.5"},
      {:floki, "~> 0.26.0"},
      {:mogrify, "~> 0.7.3"}
    ]
  end
end

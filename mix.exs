defmodule MarleySpoon.MixProject do
  use Mix.Project

  def project do
    [
      app: :marley_spoon,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MarleySpoon.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ecto_sql, "~> 3.5"},
      {:ecto, "~> 3.4"},
      {:phoenix_ecto, "~> 4.1"},
      {:contentful, "~> 0.4"},
      {:absinthe, "~> 1.5.0"},
      {:secrex, "~> 0.3", runtime: false},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end

defmodule Securion.MixProject do
  use Mix.Project

  def project do
    [
      app: :securion,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false},
      {:ecto_sql, "~> 3.0"},
      {:tesla, "~> 1.3.0"},
      {:hackney, "~> 1.15.2"},
      {:ok, ">= 2.3.0"},
      {:jason, ">= 1.0.0"}
    ]
  end
end

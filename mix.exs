defmodule Securion.MixProject do
  use Mix.Project

  @repo "https://github.com/neysofu/securion"

  def project do
    [
      app: :securion,
      version: "0.3.0",
      description: description(),
      package: package(),
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs.
      name: "Securion",
      source_url: @repo,
      homepage_url: "https://hexdocs.pm/securion/",
      docs: [
        main: "Securion"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Elixir client library to <https://api.securionpay.com>."
  end

  defp package do
    [
      maintainers: ["Filippo Costa"],
      licenses: ["ISC"],
      links: %{"GitHub" => @repo}
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:ecto_sql, "~> 3.0"},
      {:tesla, "~> 1.3.0"},
      {:hackney, "~> 1.15.2"},
      {:ok, ">= 2.3.0"},
      {:jason, ">= 1.0.0"}
    ]
  end
end

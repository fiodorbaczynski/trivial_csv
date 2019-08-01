defmodule DataQuacker.MixProject do
  use Mix.Project

  def project do
    [
      app: :data_quacker,
      version: "0.1.0",
      elixir: "~> 1.8",
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      name: "DataQuacker",
      description: "A library for validating transforming and parsing CSV data",
      source_url: "https://github.com/fiodorbaczynski/data_quacker",
      homepage_url: "https://github.com/fiodorbaczynski/data_quacker",
      docs: docs()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]

  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Fiodor Baczyński"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/fiodorbaczynski/data_quacker"}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.1", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:csv, "~> 2.3"}
    ]
  end

  defp docs() do
    [
      main: "DataQuacker",
      extras: ["README.md"],
      source_url: "https://github.com/elixir-ecto/ecto",
      groups_for_modules: [
        Schema: [
          DataQuacker.Schema
        ],
        Parsing: [
          DataQuacker
        ]
      ]
    ]
  end
end

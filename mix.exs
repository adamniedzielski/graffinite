defmodule Graffinite.Mixfile do
  use Mix.Project

  def project do
    [app: :graffinite,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Get exchange rates from National Bank of Poland.",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :calendar, :httpoison]]
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
    [
      {:calendar, "~> 0.14.0"},
      {:decimal, "~> 1.1.0"},
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 2.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Adam Niedzielski"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/adamniedzielski/graffinite"}
    ]
  end
end

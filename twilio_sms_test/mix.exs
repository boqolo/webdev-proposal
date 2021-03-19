defmodule TwilioSmsTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :twilio_sms_test,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~> 1.8"},
      {:poison, "~> 3.1"},
      {:tesla, "~> 1.4.0"},
      {:jason, ">= 1.0.0"},
      {:castore, "~> 0.1.0"},
      {:mint, "~> 1.0"},
      {:finch, "~> 0.6"}
    ]
  end
end

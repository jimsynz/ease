defmodule Ease.Mixfile do
  use Mix.Project

  @version "1.0.1"

  def project do
    [
      app: :ease,
      description: description(),
      version: @version,
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"]
      ]
    ]
  end

  def description do
    """
    Simple implementation of standard animation easing functions.
    """
  end

  def package do
    [
      maintainers: ["James Harton <james@harton.nz>"],
      licenses: ["HL3-FULL"],
      links: %{
        "Source" => "https://harton.dev/james/ease",
        "GitHub" => "https://github.com/jimsynz/ease",
        "Changelog" => "https://docs.harton.nz/james/ease/changelog.html",
        "Sponsor" => "https://github.com/sponsors/jimsynz"
      }
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 1.6", only: ~w[dev test]a, runtime: false},
      {:dialyxir, "~> 1.4", only: ~w[dev test]a, runtime: false},
      {:doctor, "~> 0.22", only: ~w[dev test]a, runtime: false},
      {:earmark, "~> 1.4", only: ~w[dev test]a, runtime: false},
      {:ex_check, "~> 0.16", only: ~w[dev test]a, runtime: false},
      {:ex_doc, "~> 0.30", only: ~w[dev test]a, runtime: false},
      {:git_ops, "~> 2.4", only: ~w[dev test]a, runtime: false}
    ]
  end
end

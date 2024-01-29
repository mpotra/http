defmodule XHTTP.MixProject do
  use Mix.Project

  @source_url "https://github.com/mpotra/xhttp"
  @version "0.1.0"

  def project do
    [
      app: :xhttp,
      version: @version,
      elixir: "~> 1.14",
      deps: deps(),
      consolidate_protocols: Mix.env() != :test,
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      description: "Elixir protocols for HTTP requests and responses",
      package: package(),

      # Docs
      name: "XHTTP",
      docs: docs()
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
      {:http_date, "~> 0.1", optional: true},
      {:timex, "~> 3.7", optional: true},
      # Docs deps only
      {:ex_doc, ">= 0.0.0", only: :docs, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Mihai Potra"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ~w(.formatter.exs mix.exs README.md lib)
    ]
  end

  defp docs do
    [
      main: "XHTTP",
      source_ref: "v#{@version}",
      extra_section: "GUIDES",
      source_url: @source_url
    ]
  end
end

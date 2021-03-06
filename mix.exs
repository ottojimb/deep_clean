defmodule DeepClean.Mixfile do
  use Mix.Project

  def project do
    [app: :deep_clean,
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  defp package do
  [
    maintainers: ["Otto Jiménez"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/ottojimb/deep_clean"}
  ]
  end

  defp description do
    """
    Exclude elements from deep nested maps or list
    """
  end


  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
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
    [{:ex_doc, "~> 0.15.0", only: :dev},
    {:dialyxir, "~> 0.5.0", only: :dev},
    {:credo, "~> 0.7.2", only: :dev}]
  end
end

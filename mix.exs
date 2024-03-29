defmodule College.Mixfile do
  use Mix.Project

  def project do
    [app: :college,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {College, []},
     applications: [
      :phoenix            ,
      :phoenix_pubsub     ,
      :phoenix_html       ,
      :cowboy             ,
      :logger             ,
      :gettext            ,
      :phoenix_ecto       ,
      :idna               ,
      :mimerl             ,
      :certifi            ,
      :hackney            ,
      :httpoison          ,
      :arc                ,
      :arc_ecto           ,
      :postgrex           ,
      :ueberauth          ,
      :ueberauth_identity ,
      :oauth              ,
      :ueberauth_facebook ,
      :ueberauth_google   , 
      :ueberauth_github   ,
    ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
			{:phoenix             , "~> 1.2.1"               } ,
			{:phoenix_pubsub      , "~> 1.0"                 } ,
			{:phoenix_ecto        , "~> 3.0"                 } ,
			{:postgrex            , ">= 0.0.0"               } ,
			{:phoenix_html        , "~> 2.6"                 } ,
			{:phoenix_live_reload , "~> 1.0"     ,only: :dev } ,
			{:gettext             , "~> 0.11"                } ,
			{:cowboy              , "~> 1.0"                 } ,
			{:arc_ecto            , "~> 0.6.0"               } ,
      #{:poison             , "~> 3.1.0"               } ,
			{:httpoison           , "~> 0.11.1"              } ,
			{:hackney             , "~> 1.7.1"               } ,
			{:uuid                , "~> 1.1.7"               } ,
      {:ueberauth           , "~> 0.4.0"               } ,
      {:ueberauth_identity  , "~> 0.2.3"               } ,
      {:ueberauth_google    , "~> 0.5.0"               } ,
      {:redbug              , "~> 1.0.0"               } ,
      {:oauth, github: "tim/erlang-oauth"              } ,
      {:ueberauth_facebook  , "~> 0.6.0"               } ,
      {:ueberauth_google    , "~> 0.5.0"               } ,
      {:ueberauth_github    , "~> 0.4.1"               } ,
      {:comeonin            , "~> 3.0.2"               } ,


      #{:mix_test_watch      , "~> 0.3" , only: :text},
   ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end

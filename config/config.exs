# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :college,
  ecto_repos: [College.Repo]

config :college, 
  upload_dir: "/tmp/uploads"

# Configures the endpoint
config :college, College.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ieF9VopNISlLEZE/+qp2qb2BfG/OeDNRS3zjDItQi5fAatUCIX46LRAbR6mgNBYO",
  render_errors: [view: College.ErrorView, accepts: ~w(html json)],
  pubsub: [name: College.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

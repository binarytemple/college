# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :college,
  ecto_repos: [College.Repo]

config :college, :identity, "college admissions system"

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

config :ueberauth, Ueberauth,
  providers: [
    identity: { Ueberauth.Strategy.Identity, [
        callback_methods: ["POST"],
        uid_field: :email,
        nickname_field: :email,
        ] },
    facebook: { Ueberauth.Strategy.Facebook, [
            default_scope: "email,public_profile,manage_pages,publish_pages"
      ] },
    github: { Ueberauth.Strategy.Github, [] },
    google: { Ueberauth.Strategy.Google, 
        [
          #default_scope: "emails profile plus.me",
          default_scope: "profile",
          #hd: "example.com", 
          approval_prompt: "force", 
          access_type: "offline"
      ]
    },
  ]

#config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
#  client_id: System.get_env("FACEBOOK_APP_ID"),
#  client_secret: System.get_env("FACEBOOK_APP_SECRET"),
#  redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")
#
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")


config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")


#To make API calls, it is necessary to configure your Stripe secret key (and optional platform client id if you are using Stripe Connect):


config :stripity_stripe, secret_key: System.get_env("STRIPE_SECRET_KEY")

config :stripity_stripe, platform_client_id: System.get_env("STRIPE_CLIENT_ID")




#
#config :ueberauth, Ueberauth.Strategy.Google.OAuth,
#  client_id: System.get_env("GOOGLE_CLIENT_ID"),
#  client_secret: System.get_env("GOOGLE_CLIENT_SECRET"),
#  redirect_uri: System.get_env("GOOGLE_REDIRECT_URI")
#
#config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
#  client_id: System.get_env("SLACK_CLIENT_ID"),
#  client_secret: System.get_env("SLACK_CLIENT_SECRET")
#
#config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
#  consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
#  consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET")




# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

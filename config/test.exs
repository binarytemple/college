use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :college, College.Endpoint,
  http: [port: 4001],
  server: false

config :college, 
  upload_dir: "/tmp/test_uploads"


# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :college, College.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "college_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

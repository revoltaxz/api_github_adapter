# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :api_github_adapter, ApiGithubAdapterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gzELcaciLl5qd1QUvbQ8pDKnx5Ee199Y5k8kB+D/0geqZA1rhxPJvz5AFw7adYiu",
  render_errors: [view: ApiGithubAdapterWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApiGithubAdapter.PubSub,
  live_view: [signing_salt: "przlCKYl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

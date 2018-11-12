# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :audionations,
  ecto_repos: [Audionations.Repo]

# Configures the endpoint
config :audionations, AudionationsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZwLWi8FhkZ1EIE0Q0BeyR8a8xef47E2lPR6E0C2btgiLKBYVz1naaAXzeic8WgSu",
  render_errors: [view: AudionationsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Audionations.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

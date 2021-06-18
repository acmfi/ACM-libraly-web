# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :libralyweb,
  ecto_repos: [Libralyweb.Repo]

# Configures the endpoint
config :libralyweb, LibralywebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B7qYy/zs0ujimui/pwbk6Nwplz7OE179K+RiZmgZkWajwg+sQJu8mGRuMIs0nESV",
  render_errors: [view: LibralywebWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Libralyweb.PubSub,
  live_view: [signing_salt: "Xag15fSV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

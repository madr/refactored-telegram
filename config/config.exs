# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :utsokt,
  ecto_repos: [Utsokt.Repo]

config :utsokt_web,
  ecto_repos: [Utsokt.Repo],
  generators: [context_app: :utsokt]

# Configures the endpoint
config :utsokt_web, UtsoktWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Lffo4LHrtQwPUji3TzVcBit33AMHkNdz41LB36tMo5X2BtsDDEQNFJqQAc8R5d+Q",
  render_errors: [view: UtsoktWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Utsokt.PubSub,
  live_view: [signing_salt: "sePmbWGm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

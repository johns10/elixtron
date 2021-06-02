# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixtron, ecto_repos: [Elixtron.Repo], generators: [binary_id: true]

# Configures the endpoint
config :elixtron, ElixtronWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: ElixtronWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Elixtron.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# POW Configuration
config :elixtron, :pow,
  user: Elixtron.Users.User,
  repo: Elixtron.Repo,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  web_module: ElixtronWeb,
  mailer_backend: ElixtronWeb.Pow.Mailer

config :kaffy,
   otp_app: :elixtron,
   ecto_repo: Elixtron.Repo,
   router: ElixtronWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

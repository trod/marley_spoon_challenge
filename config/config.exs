import Config

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :marley_spoon, MarleySpoonWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

config :phoenix, :json_library, Jason

config :secrex,
  key_file: ".secret-key",
  files: ["config/prod.secret.exs"]

config :marley_spoon, MarleySpoon.Worker, enabled: false

import_config "#{Mix.env()}.exs"

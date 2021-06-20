import Config
config :logger, level: :info

config :marley_spoon, MarleySpoon.Worker, enabled: true

import_config "prod.secret.exs"

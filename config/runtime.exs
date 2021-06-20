import Config

config :marley_spoon,
       :worker_enabled,
       (case(config_env()) do
          :prod -> true
          _ -> false
        end)

import Config

config :nostrum,
  num_shards: :auto

import_config "#{config_env()}.exs"

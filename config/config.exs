import Config

config :nostrum,
  num_shards: :auto

import_config "#{Mix.env()}.exs"

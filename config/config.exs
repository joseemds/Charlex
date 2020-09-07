import Config

config :nostrum,
  num_shards: :auto,
  token: System.get_env("BOT_TOKEN")

import_config "#{Mix.env()}.exs"

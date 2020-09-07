import Config

config :charlex,
  prefix: "::"

config :nostrum,
  token: System.get_env("BOT_TOKEN")

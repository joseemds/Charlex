defmodule Charlex.Command.Profile do
  require Logger
  use Charlex.Command

  @impl true
  def run(context, [user_id]) do
    avatar_url =
      user_id
      |> String.replace(~r/[^\d]/, "")
      |> Nostrum.Api.get_user!()
      |> Nostrum.Struct.User.avatar_url()

    Nostrum.Api.create_message(context.message.channel_id, avatar_url)
  end

  @impl true
  def run(context, []) do
    avatar_url = Nostrum.Struct.User.avatar_url(context.message.author)
    Nostrum.Api.create_message(context.message.channel_id, avatar_url)
  end
end

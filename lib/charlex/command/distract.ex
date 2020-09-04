defmodule Charlex.Command.Distract do
  use Charlex.Command
  alias Nostrum.Api

  @impl true
  def run(context, _args) do
    Api.create_message(context.message.channel_id,
      file: Path.expand("assets/distraction.gif")
    )
  end
end

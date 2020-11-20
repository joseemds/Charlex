defmodule Charlex.Command.Pet do
  use Charlex.Command
  alias Nostrum.Api

  @impl true
  def run(context, _args) do
    Api.create_message(context.message.channel_id,
      file: Path.expand("assets/petdudu.gif")
    )
  end
end

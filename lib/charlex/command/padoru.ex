defmodule Charlex.Command.Padoru do
  use Charlex.Command
  alias Nostrum.Api

  @impl true
  def run(context, _args) do
    Api.create_message(
      context.message.channel_id,
      "#{Date.diff(~D[2020-12-25], Date.utc_today())} days until Christmas"
    )
  end
end

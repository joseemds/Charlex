defmodule Charlex.Command.Padoru do
  use Charlex.Command
  alias Nostrum.Api

  @impl true
  def run(context, _args) do
    Api.create_message(
      context.message.channel_id,
      "#{Timex.diff(~D[2020-12-25], Timex.now("America/Sao_Paulo"), :days)} days until Christmas"
    )
  end
end

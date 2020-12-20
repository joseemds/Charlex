defmodule Charlex.Command.Padoru do
  use Charlex.Command
  alias Nostrum.Api

  def get_left_days(date) do
    case Timex.diff(date, Timex.now(), :days) do
      1 ->
        "OMG ALMOST THERE ONLY ONE DAY"

      0 ->
        "HAPPY PADORUUUUUUUUUUUUUUUUUUUUU"


      _ ->
        "#{Timex.diff(date, Timex.now("America/Sao_Paulo"), :days)} days until christmas"
    end
  end

  @impl true
  def run(context, _args) do
    christmas_date = Timex.from_iso_day(360) 

    Api.create_message(
      context.message.channel_id,
      get_left_days(christmas_date)
    )
  end
end

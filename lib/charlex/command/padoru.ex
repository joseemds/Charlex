defmodule Charlex.Command.Padoru do
  use Charlex.Command
  alias Nostrum.Api

  def get_left_days(date) do
    diff = Timex.diff(date, Timex.now(), :days)

    cond do
      diff == 1 ->
        "OMG ALMOST THERE ONLY ONE DAY"

      diff == 0 ->
        "HAPPY PADORUUUUUUUUUUUUUUUUUUUU"

      diff < 0 ->
        date = date |> Map.put(:year, date.year + 1)
        "#{Timex.diff(date, Timex.now("America/Sao_Paulo"), :days)} days until christmas"

      true ->
        "#{Timex.diff(date, Timex.now("America/Sao_Paulo"), :days)} days until christmas"
    end
  end

  @impl true
  def run(context, _args) do
    christmas_date =
      cond do
        Timex.is_leap?(Timex.now()) == true -> Timex.from_iso_day(360)
        true -> Timex.from_iso_day(359)
      end

    Api.create_message(
      context.message.channel_id,
      get_left_days(christmas_date)
    )
  end
end

defmodule Charlex.Command.Plan do
  use Charlex.Command

  @impl true
  def usage() do
    """
    <prefix> !plan

    """
  end

  @impl true
  def description() do
    """
    Will output the famous Charles phrase, THIS IS THE GREATEST PLAAAAN
    """
  end

  @impl true
  def run() do
    "THIS IS THE GREATEST PLAAAAAAAN"
  end
end

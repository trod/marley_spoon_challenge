defmodule MarleySpoon.Worker do
  @moduledoc """
  Regulary fetches recipes and chefs from Contentful
  """

  use GenServer
  alias MarleySpoon.Importer

  require Logger

  @interval 10_000
  @supported_entities [:chef, :recipe]

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    :timer.send_interval(@interval, :tick)

    {:ok, 0}
  end

  def handle_info(:tick, state) do
    if Application.get_env(:marley_spoon, __MODULE__)[:enabled], do: work()

    {:noreply, state}
  end

  defp work do
    {:ok, count} = Importer.fetch_all(@supported_entities)
    Logger.info("Update is finished, #{count} entities upserted.")
  end
end

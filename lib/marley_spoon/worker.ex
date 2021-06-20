defmodule MarleySpoon.Worker do
  @moduledoc """
  Regulary fetches recipes and chefs from Contentful
  """

  use GenServer
  require Logger

  @interval 10_000

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    :timer.send_interval(@interval, :tick)

    {:ok, 0}
  end

  def handle_info(:tick, state) do
    if Application.get_env(:marley_spoon, :worker_enabled), do: work()

    {:noreply, state}
  end

  defp work do
    Logger.info("Start chefs update")
    MarleySpoon.Client.fetch_and_upsert_chefs()

    Logger.info("Start recipes update")
    MarleySpoon.Client.fetch_and_upsert_recipes()

    Logger.info("Update is done")
  end
end

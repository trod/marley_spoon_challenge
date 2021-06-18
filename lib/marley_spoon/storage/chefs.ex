defmodule MarleySpoon.Storage.Chefs do
  @moduledoc """
  Stores chefs in ets sotrage and provide access.
  """
  use GenServer

  @t :chefs

  def init(arg) do
    :ets.new(@t, [
      :set,
      :public,
      :named_table,
      {:read_concurrency, true},
      {:write_concurrency, true}
    ])

    {:ok, arg}
  end

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @spec get_by_id(binary()) :: binary() | :not_found
  def get_by_id(id) do
    case :ets.lookup(@t, id) do
      [] ->
        :not_found

      [{_key, value}] ->
        value
    end
  end

  @spec put(binary(), map()) :: boolean()
  def put(key, value) when is_map(value) do
    :ets.insert(@t, {key, value})
  end
end

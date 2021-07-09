defmodule MarleySpoon.Clients.Client do
  @callback fetch_entities(term) :: {:ok, list()} | {:error, atom}

  defmacro __using__(_opts) do
    quote do
      @behaviour unquote(__MODULE__)
    end
  end
end

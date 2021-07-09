defmodule MarleySpoon.Clients.Contentful do
  import Contentful.Query
  use MarleySpoon.Clients.Client

  alias Contentful.Delivery.Entries

  @error {:error, :unable_to_fetch_resource}

  @impl true
  def fetch_entities(content_type) when is_atom(content_type) do
    content_type
    |> Atom.to_string()
    |> do_fetch_entities()
  end

  defp do_fetch_entities(type) do
    try do
      Entries
      |> content_type(type)
      |> fetch_all()
      |> case do
        {:ok, entries, _} ->
          entries

        _ ->
          @error
      end
    rescue
      _e -> @error
    end
  end
end

defmodule MarleySpoon.Importer do
  require Logger
  import MarleySpoon.Clients.Contentful, only: [fetch_entities: 1]

  def fetch_all(types) do
    inserted =
      types
      |> Enum.map(fn type -> {parser(type), fetch_entities(type)} end)
      |> Enum.map(fn {parser, entries} -> entries |> Enum.map(&parser.parse_and_persist/1) end)
      |> List.flatten()
      |> Enum.count()

    {:ok, inserted}
  end

  defp parser(type) do
    case type do
      :chef -> MarleySpoon.Parser.Chef
      :recipe -> MarleySpoon.Parser.Recipe
    end
  end
end

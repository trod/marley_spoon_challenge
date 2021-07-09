defmodule MarleySpoon.Parser.Chef do
  @behaviour MarleySpoon.Parser.Base

  alias MarleySpoon.Storage.Chefs, as: ChefStorage
  alias MarleySpoon.Model.Chef, as: Chef

  @impl true
  def parse_and_persist(term) do
    term
    |> parse()
    |> validate()
    |> persist()
  end

  defp parse(term) do
    case term do
      %{sys: %{id: id}, fields: %{"name" => name}} -> %{id: id, name: name}
      _ -> %{}
    end
  end

  defp validate(term) do
    case Chef.from_map(term) do
      {:ok, chef} -> chef
      _ -> :error
    end
  end

  defp persist(%Chef{} = chef) do
    ChefStorage.put(chef.id, chef)
  end

  defp persist(_) do
    :noop
  end
end

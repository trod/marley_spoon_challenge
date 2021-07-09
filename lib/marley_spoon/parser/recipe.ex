defmodule MarleySpoon.Parser.Recipe do
  @behaviour MarleySpoon.Parser.Base

  alias MarleySpoon.Storage.Recipes, as: RecipeStorage
  alias MarleySpoon.Model.Recipe, as: Recipe

  @impl true
  def parse_and_persist(term) do
    term
    |> parse()
    |> validate()
    |> persist()
  end

  defp parse(term) do
    case term do
      %{
        sys: %{id: id},
        fields: %{"description" => description, "title" => title}
      } ->
        %{id: id, description: description, title: title}

      _ ->
        %{}
    end
  end

  defp validate(term) do
    case Recipe.from_map(term) do
      {:ok, recipe} -> recipe
      _ -> :error
    end
  end

  defp persist(%Recipe{} = recipe) do
    RecipeStorage.put(recipe.id, recipe)
  end

  defp persist(_) do
    :noop
  end
end

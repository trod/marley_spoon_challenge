defmodule MarleySpoonWeb.Resolvers.RecipeResolver do
  alias MarleySpoon.Storage.Recipes
  alias MarleySpoon.Model.Recipe, as: RecipeModel
  alias MarleySpoon.Storage.Entities

  def find(%{id: id}, _parent) do
    case Recipes.get_by_id(id) do
      %RecipeModel{id: _id} = recipe -> {:ok, recipe}
      _ -> {:error, "Recipe #{id} not found!"}
    end
  end

  def list_recipes(_args, _parent), do: Entities.all_recipes()
end

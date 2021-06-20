defmodule MarleySpoon.Storage.Entities do
  alias MarleySpoon.Storage.{Chefs, Recipes}

  @spec get_chef_by_recipe_id(binary()) :: Chefs | :not_found
  def get_chef_by_recipe_id(id) do
    case MarleySpoon.Storage.Recipes.get_by_id(id) do
      %{chef_id: chef_id} -> {:ok, Chefs.get_by_id(chef_id)}
      _ -> {:error, :not_found}
    end
  end

  @spec all_recipes() :: list(Recipes)
  def all_recipes(), do: {:ok, Recipes.all()}

  @spec all_chefs() :: list(Chefs)
  def all_chefs(), do: {:ok, Chefs.all()}
end

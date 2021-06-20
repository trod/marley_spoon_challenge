defmodule MarleySpoon.Storage.RecipesTest do
  alias MarleySpoon.Storage.Recipes
  alias MarleySpoon.Model.Recipe, as: RecipeModel
  use MarleySpoonWeb.ConnCase
  use ExUnit.Case

  setup do
    cleanup_ets()

    :ok
  end

  test "puts new recipe into the storage and gets by key" do
    id = "1"
    title = "new_title"
    description = "new_description"

    assert Recipes.put(id, %RecipeModel{title: title, description: description, id: id})
    assert %RecipeModel{id: id, description: description, title: title} == Recipes.get_by_id(id)
  end
end

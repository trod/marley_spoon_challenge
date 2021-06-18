defmodule MarleySpoon.Storage.RecipesTest do
  alias MarleySpoon.Storage.Recipes
  use ExUnit.Case

  test "puts new recipe into the storage and gets by key" do
    id = "1"
    title = "new_title"
    description = "new_description"

    assert Recipes.put(id, %{title: title, description: description, id: id})

    assert %{id: id, description: description, title: title} == Recipes.get_by_id(id)
  end
end

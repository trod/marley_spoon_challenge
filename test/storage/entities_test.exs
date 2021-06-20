defmodule MarleySpoon.Storage.EntitiesTest do
  alias MarleySpoon.Storage.Chefs
  alias MarleySpoon.Storage.Recipes
  alias MarleySpoon.Storage.Entities
  alias MarleySpoon.Model.Chef, as: ChefModel
  alias MarleySpoon.Model.Recipe, as: RecipeModel
  use MarleySpoonWeb.ConnCase
  use ExUnit.Case

  setup do
    cleanup_ets()

    :ok
  end

  test "returns assigned Chef" do
    chef_id = "1"
    recipe_id = "2"
    name = "new_name"

    assert Chefs.put(chef_id, %ChefModel{id: chef_id, name: name})

    assert Recipes.put(recipe_id, %RecipeModel{
             id: recipe_id,
             chef_id: chef_id,
             title: "my_title",
             description: "my_description"
           })

    assert {:ok, %MarleySpoon.Model.Chef{id: chef_id, name: name}} ==
             Entities.get_chef_by_recipe_id(recipe_id)
  end

  test "returns not found for recipe without assigned chef" do
    recipe_id = "2"

    assert Recipes.put(recipe_id, %RecipeModel{
             id: recipe_id,
             chef_id: nil,
             title: "my_title",
             description: "my_description"
           })

    assert {:ok, :not_found} ==
             Entities.get_chef_by_recipe_id(recipe_id)
  end

  test "returns all chefs" do
    assert Chefs.put("1", %ChefModel{id: "1", name: "john"})
    assert Chefs.put("2", %ChefModel{id: "2", name: "jack"})

    assert {:ok,
            [
              %ChefModel{id: "1", name: "john"},
              %ChefModel{id: "2", name: "jack"}
            ]} ==
             Entities.all_chefs()
  end

  test "returns all recipes" do
    assert Recipes.put("1", %RecipeModel{
             id: "1",
             chef_id: nil,
             title: "nachos",
             description: "nachos"
           })

    assert Recipes.put("2", %RecipeModel{
             id: "2",
             chef_id: nil,
             title: "pelmeni",
             description: "my_description_2"
           })

    assert {
             :ok,
             [
               %MarleySpoon.Model.Recipe{
                 id: "1",
                 chef_id: nil,
                 description: "nachos",
                 title: "nachos"
               },
               %MarleySpoon.Model.Recipe{
                 id: "2",
                 chef_id: nil,
                 description: "my_description_2",
                 title: "pelmeni"
               }
             ]
           } ==
             Entities.all_recipes()
  end
end

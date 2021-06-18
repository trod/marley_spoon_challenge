defmodule MarleySpoon.Model.RecipeTest do
  alias MarleySpoon.Model.Recipe

  use ExUnit.Case

  describe "#from_map/1" do
    setup do
      valid_attrs = %{title: "new_recipe_title", description: "new_recipe_description", id: "123"}

      {:ok, valid_attrs: valid_attrs}
    end

    test "creates a new recipe with valid params", %{valid_attrs: valid_attrs} do
      valid_attrs = %{
        title: valid_attrs.title,
        description: valid_attrs.description,
        id: valid_attrs.id
      }

      assert {:ok,
              %Recipe{
                id: valid_attrs.id,
                title: valid_attrs.title,
                description: valid_attrs.description
              }} ==
               Recipe.from_map(valid_attrs)
    end

    test "creates a new recipe with valid params and chef_id", %{valid_attrs: valid_attrs} do
      chef_id = "567"

      attrs_with_chef = Map.put(valid_attrs, :chef_id, chef_id)

      assert {:ok,
              %Recipe{
                id: valid_attrs.id,
                title: valid_attrs.title,
                description: valid_attrs.description,
                chef_id: chef_id
              }} ==
               Recipe.from_map(attrs_with_chef)
    end

    test "returns an error with invalid params" do
      invalid_attrs = %{}

      assert {
               :error,
               {
                 :invalid_recipe_map,
                 [
                   {:id, {"can't be blank", [validation: :required]}},
                   {:title, {"can't be blank", [validation: :required]}},
                   {:description, {"can't be blank", [validation: :required]}}
                 ]
               }
             } ==
               Recipe.from_map(invalid_attrs)
    end
  end
end

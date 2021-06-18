defmodule MarleySpoon.Model.ChefTest do
  alias MarleySpoon.Model.Chef

  use ExUnit.Case

  describe "#from_map/1" do
    test "creates a new chef with valid params" do
      name = "new_chef"
      id = "123"

      valid_attrs = %{name: name, id: id}

      assert {:ok, %Chef{id: id, name: name}} == Chef.from_map(valid_attrs)
    end

    test "returns an error with invalid params" do
      invalid_attrs = %{}

      assert {
               :error,
               {
                 :invalid_chef_map,
                 [
                   {:name, {"can't be blank", [validation: :required]}},
                   {:id, {"can't be blank", [validation: :required]}}
                 ]
               }
             } ==
               Chef.from_map(invalid_attrs)
    end
  end
end

defmodule MarleySpoon.Storage.ChefsTest do
  alias MarleySpoon.Storage.Chefs
  alias MarleySpoon.Model.Chef, as: ChefModel
  use MarleySpoonWeb.ConnCase
  use ExUnit.Case

  setup do
    cleanup_ets()

    :ok
  end

  test "puts new chef into the storage and gets by key" do
    id = "1"
    name = "new_name"

    assert Chefs.put(id, %ChefModel{id: id, name: name})
    assert %ChefModel{id: id, name: "new_name"} == Chefs.get_by_id(id)
  end
end

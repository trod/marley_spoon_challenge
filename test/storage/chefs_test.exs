defmodule MarleySpoon.Storage.ChefsTest do
  alias MarleySpoon.Storage.Chefs
  use ExUnit.Case

  test "puts new chef into the storage and gets by key" do
    id = "1"
    name = "new_name"
    assert Chefs.put(id, %{name: name})

    assert %{name: "new_name"} == Chefs.get_by_id(id)
  end
end

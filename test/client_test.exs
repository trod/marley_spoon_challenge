defmodule MarleySpoon.ClientTest do
  alias MarleySpoon.Client
  alias MarleySpoon.Fixtures.Chef, as: ChefFixture
  alias MarleySpoon.Fixtures.Recipe, as: RecipeFixture
  alias Contentful.Delivery.Entries
  alias Contentful.Query
  use ExUnit.Case, async: false

  import Mock

  describe "#fetch_and_upsert_chefs/0" do
    test "get a list of chefs and upserts it" do
      with_mocks([
        {Query, [], [content_type: fn Entries, "chef" -> {Entries, [content_type: "chef"]} end]},
        {Query, [], [fetch_all: fn {Entries, content_type: "chef"} -> ChefFixture.chefs() end]}
      ]) do
        assert [true, true, true] == Client.fetch_and_upsert_chefs()
      end
    end
  end

  describe "#fetch_and_upsert_recipes/0" do
    test "get a list of recipes and upserts it" do
      with_mocks([
        {Query, [],
         [content_type: fn Entries, "recipe" -> {Entries, [content_type: "recipe"]} end]},
        {Query, [],
         [fetch_all: fn {Entries, content_type: "recipe"} -> RecipeFixture.recipes() end]}
      ]) do
        assert [true, true, true, true] == Client.fetch_and_upsert_recipes()
      end
    end
  end
end

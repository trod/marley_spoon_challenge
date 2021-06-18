defmodule MarleySpoon.Client do
  import Contentful.Query

  alias Contentful.Delivery.Entries
  alias MarleySpoon.Model.{Chef, Recipe}
  alias MarleySpoon.Storage

  @chef "chef"
  @reciepe "recipe"

  @spec fetch_and_upsert_chefs() :: list()
  def fetch_and_upsert_chefs, do: do_fetch_and_upsert_entries(@chef)

  @spec fetch_and_upsert_recipes() :: list()
  def fetch_and_upsert_recipes, do: do_fetch_and_upsert_entries(@reciepe)

  defp do_fetch_and_upsert_entries(type) do
    processor =
      case type do
        @chef -> &process_chef_entries/1
        @reciepe -> &process_recipe_entries/1
      end

    with {:ok, entries, total: _total_count_of_entries} <-
           fetch_entries(type),
         {:ok, processed_entries} <- processor.(entries) do
      Enum.map(processed_entries, &Storage.Chefs.put(&1.entry.id, &1.entry))
    end
  end

  defp fetch_entries(content_type) do
    {:ok, _entries, total: _total_count_of_entries} =
      Entries
      |> content_type(content_type)
      |> fetch_all()
  end

  defp process_chef_entries(entries) do
    {successful, _failed} =
      entries
      |> Enum.map(&extract_chef_params/1)
      |> Enum.map(&Chef.from_map/1)
      |> Enum.map(&handle_result(&1))
      |> Enum.split_with(&(&1.status == :ok))

    {:ok, successful}
  end

  defp process_recipe_entries(entries) do
    {successful, _failed} =
      entries
      |> Enum.map(&extract_recipe_params/1)
      |> Enum.map(&Recipe.from_map/1)
      |> IO.inspect()
      |> Enum.map(&handle_result(&1))
      |> Enum.split_with(&(&1.status == :ok))

    {:ok, successful}
  end

  defp extract_recipe_params(%{
         sys: %{id: id},
         fields: %{
           "title" => title,
           "description" => description,
           "chef" => %{"sys" => %{"id" => chef_id}}
         }
       }) do
    %{description: description, title: title, chef_id: chef_id, id: id}
  end

  defp extract_recipe_params(%{
         sys: %{id: id},
         fields: %{"description" => description, "title" => title}
       }) do
    %{id: id, description: description, title: title}
  end

  defp extract_recipe_params(_), do: %{}

  defp extract_chef_params(%{sys: %{id: id}, fields: %{"name" => name}}) do
    %{id: id, name: name}
  end

  defp extract_chef_params(_), do: %{}

  defp handle_result({:ok, entry}), do: %{entry: entry, status: :ok}
  defp handle_result({:error, error}), do: %{error: error, status: :failed}
  defp handle_result(_), do: %{error: "unknown error", status: :failed}
end

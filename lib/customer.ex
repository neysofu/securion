defmodule Securion.Customer do
  use Ecto.Schema
  alias Securion.Resource

  defp path(id \\ nil) do
    case id do
      nil -> "/customers"
      _ -> "/customers/" <> id
    end
  end

  def get(id) do
    Resource.fetch(path(id), [])
  end

  def create(email, description \\ "") do
    Resource.create(path(), %{email: email, description: description})
  end

  def update(id, params) do
    Resource.update(path(id), params)
  end

  def delete(id) do
    Resource.delete(path(id))
  end
end

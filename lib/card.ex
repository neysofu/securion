defmodule Securion.Card do
  use Ecto.Schema
  alias Securion.Resource

  @path_base "/customers/"

  defp url(customer_id, id \\ nil) do
    @path_base <>
      case id do
        nil -> customer_id
        _ -> customer_id <> "/cards/" <> id
      end
  end

  def get(customer_id, id) do
    Resource.fetch(url(customer_id, id), [])
  end

  def create(customer_id, token) do
    Resource.create(url(customer_id), %{id: token})
  end

  def update(customer_id, id, params) do
    Resource.update(url(customer_id, id), params)
  end

  def delete(customer_id, id) do
    Resource.delete(url(customer_id, id))
  end
end

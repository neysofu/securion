defmodule Securion.Customer do
  @moduledoc """
  CRUD operations for SecurionPay customers.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  alias Securion.Resource

  defp path(id \\ nil) do
    case id do
      nil -> "/customers"
      _ -> "/customers/" <> id
    end
  end

  def get(id) do
    Resource.get(path(id), [])
  end

  def create(email, description \\ "") do
    Resource.post(path(), %{email: email, description: description})
  end

  def update(id, params) do
    Resource.post(path(id), params)
  end

  def delete(id) do
    Resource.delete(path(id))
  end

  def list_path(params) do
    Resource.get(path(), params)
  end
end

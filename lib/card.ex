defmodule Securion.Card do
  @moduledoc """
  CRUD operations for payment cards.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  use Ecto.Schema
  alias Securion.Resource

  defp url(customer_id, id \\ nil) do
    base_path = "/customers/" <> customer_id

    case id do
      nil -> base_path
      _ -> base_path <> "/cards/" <> id
    end
  end

  @doc """
  [https://securionpay.com/docs/api#card-retrieve]()
  Retrieves an existing card object.

  ## Examples

      iex> Securion.Card.create(customer_id, token_id)
  """
  def get(customer_id, id) do
    Resource.fetch(url(customer_id, id), [])
  end

  @doc """
  Creates a new card object.

  ## Examples
  """
  def create(customer_id, token_id) do
    Resource.create(url(customer_id), %{id: token_id})
  end

  def update(customer_id, id, params) do
    Resource.update(url(customer_id, id), params)
  end

  def delete(customer_id, id) do
    Resource.delete(url(customer_id, id))
  end
end

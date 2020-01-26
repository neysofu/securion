defmodule Securion.Card do
  @moduledoc """
  CRUD operations for payment cards.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  alias Securion.Resource
  import Securion.Utils

  defp path(customer_id, id \\ nil) do
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
    Resource.get(path(customer_id, id), [])
  end

  @doc """
  Creates a new card by providing a token id.

  ## Examples
  """
  def create_by_token(customer_id, token_id) do
    Resource.post(path(customer_id), %{id: token_id})
  end

  @doc """
  Updates an existing card.

  Any not provided parameter will be left unchanged.
  """
  def update(customer_id, id, params) do
    Resource.post(path(customer_id, id), params)
  end

  @doc """
  Deletes an existing card.

  If you delete card that is current default card then most recently
  added card will be used as new default card. If you delete last card then
  default card will be set to `null`.
  """
  def delete(customer_id, id) do
    Resource.delete(path(customer_id, id))
  end

  @doc """
  Lists cards for given customer.
  """
  def list(customer_id, params) do
    %{path: path(customer_id), params: Enum.into(params, %{})}
  end
end

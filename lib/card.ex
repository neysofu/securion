defmodule Securion.Card do
  @moduledoc """
  CRUD operations for payment cards.

  Card represents a credit or a debit card.

  Cards are used to save a credit or a debit card data for later use. Cards can
  also be used to represent card data in other operations (for example to
  specify card data when creating a new change).

  > Corresponding [docs](https://securionpay.com/docs/api#cards) for the
  original REST APIs.

  ## Example

      iex> {:ok, card} = Card.create_by_token("cust_ ...", "tok_ ...")
  """

  alias Securion.Resource

  defp path(customer_id, id \\ nil) do
    base_path = "/customers/" <> customer_id <> "/cards"

    case id do
      nil -> base_path
      _ -> base_path <> "/" <> id
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

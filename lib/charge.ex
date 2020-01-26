defmodule Securion.Charge do
  @moduledoc """
  CRUD operations for transactions.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  alias Securion.Resource

  defp path(id \\ nil) do
    case id do
      nil -> "/charges"
      _ -> "/charges/" <> id
    end
  end

  @doc """
  [https://securionpay.com/docs/api#card-retrieve]()
  Retrieves an existing card object.

  ## Examples

      iex> Securion.Card.create(customer_id, token_id)
  """
  def get(id) do
    Resource.get(path(id), [])
  end

  @doc """
  Creates a new card object.

  ## Examples
  """
  def create(customer_id, token_id) do
    Resource.create(path(), %{id: token_id})
  end

  def capture(id) do
    Resource.post(path(id) <> "/capture", %{})
  end

  def update(id, params) do
    Resource.post(path(id), params)
  end

  def refund(id, amount) do
    params =
      if amount == nil do
        %{}
      else
        %{amount: amount}
      end

    Resource.post(path(id) <> "/refund", params)
  end

  def list(customer_id, []) do
    %{path: path(customer_id), params: %{}}
  end

  def list(customer_id, params) do
    params = %{created: Enum.into(params, %{})}
    %{path: path(customer_id), params: params}
  end
end

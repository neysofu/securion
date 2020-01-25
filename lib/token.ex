defmodule Securion.Token do
  @moduledoc """
  Card tokens creation and deletion.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  use Ecto.Schema
  alias Securion.Resource

  defp url(id \\ nil) do
    case id do
      nil -> "/tokens"
      _ -> "/tokens/" <> id
    end
  end

  @doc """
  Retrieves an existing token object.

  ## Example

      iex> {:ok, token} = Token.create(FakeCards.visa_1())
      {:ok, ...}
      iex> Token.get(token["id"])
      {:ok, ...}
  """
  def get(id) do
    Resource.fetch(url(id), [])
  end

  def create(card_details) do
    Resource.create(url(), card_details)
  end

  def update(id, params) do
    Resource.update(url(id), params)
  end

  def delete(id) do
    Resource.delete(url(id))
  end
end

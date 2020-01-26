defmodule Securion.Token do
  @moduledoc """
  Card tokens creation and deletion.

  ## Prelude to the examples

      iex> customer_id = Securion.Customer.create("foo@example.com")

      iex> token_id = Securion.Token.create()
  """

  alias Securion.Resource

  defp path(id \\ nil) do
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
    Resource.get(path(id), [])
  end

  def create(params) do
    Resource.post(path(), params)
  end
end

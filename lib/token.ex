defmodule Securion.Token do
  use Ecto.Schema
  alias Securion.Resource

  defp url(id \\ nil) do
    case id do
      nil -> "/tokens"
      _ -> "/tokens/" <> id
    end
  end

  def get(id) do
    Resource.fetch(url(id), [])
  end

  def create(pan, exp_month, exp_year, cvc) do
    body = %{number: pan, expMonth: exp_month, expYear: exp_year, cvc: cvc}
    Resource.create(url(), body)
  end
end

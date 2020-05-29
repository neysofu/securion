defmodule Securion.Event do
  @moduledoc """
  SecurionPay events.
  """

  alias Securion.Resource

  defp path(id \\ nil) do
    case id do
      nil -> "/events"
      _ -> "/events/" <> id
    end
  end

  def get(id) do
    Resource.get(path(id), [])
  end

  def list_path(params) do
    Resource.get(path(), params)
  end
end


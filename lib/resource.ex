defmodule Securion.Resource do
  @moduledoc false

  alias Securion.Client
  import ProperCase

  defp handle_response(response) do
    case response do
      {:ok, data} ->
        if Map.has_key?(data.body, "error") do
          {:error, atomify_map(data.body["error"])}
        else
          {:ok, atomify_map(data.body)}
        end

      {:error, err} ->
        {:error, atomify_map(err)}
    end
  end

  defp atomify_map(map) do
    for {key, val} <- to_snake_case(map),
        into: %{},
        do: {String.to_atom(key), val}
  end

  defp stringify_map(map) do
    for(
      {key, val} <- map,
      into: %{},
      do: {Atom.to_string(key), val}
    )
    |> to_camel_case()
  end

  def get(path, query) do
    Client.get(path, query: stringify_map(query))
    |> handle_response
  end

  def post(path, request_body) do
    Client.post(path, stringify_map(request_body))
    |> handle_response
  end

  def delete(path) do
    Client.delete(path)
    |> handle_response
  end
end

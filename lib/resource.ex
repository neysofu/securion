defmodule Securion.Resource do
  @moduledoc false

  alias Securion.Client
  import ProperCase
  use OK.Pipe

  defp get_body(response) do
    response.body
  end

  defp atomify_map(map) do
    for {key, val} <- to_snake_case(map),
        into: %{},
        do: {String.to_atom(key), val}
  end

  defp stringify_map(map) do
    (for {key, val} <- map,
        into: %{},
        do: {Atom.to_string(key), val}) |> to_camel_case()
  end

  def get(path, query) do
    Client.get(path, query: stringify_map(query))
    ~> get_body
    ~> atomify_map
  end

  def post(path, request_body) do
    Client.post(path, stringify_map(request_body))
    ~> get_body
    ~> atomify_map
  end

  def delete(path) do
    Client.delete(path)
    ~> get_body
    ~> atomify_map
  end
end

defmodule Securion.Lister do
  use Tesla

  @default_limit 10
  @secret_key Application.get_env(:securion, :secret_key)

  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.BasicAuth, username: @secret_key)

  def fetch(url, limit \\ @default_limit) do
    get(url, query: [limit: limit])
  end

  def fetch_after(url, cursor, limit \\ @default_limit) do
    get(url, query: [limit: limit, startingAfterId: cursor])
  end

  def fetch_before(url, cursor, limit \\ @default_limit) do
    get(url, query: [limit: limit, startingBeforeId: cursor])
  end
end

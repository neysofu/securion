defmodule Securion.Resource do
  use Tesla
  use OK.Pipe

  @base_url "https://api.securionpay.com"
  @secret_key Application.get_env(:securion, :secret_key)

  plug(Tesla.Middleware.BaseUrl, @base_url)
  plug(Tesla.Middleware.BasicAuth, username: @secret_key)
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.FormUrlencoded)

  def fetch(path, query) do
    get(path, query: query) |> OK.map(& &1.body)
  end

  def create(path, request_body) do
    post(path, request_body) |> OK.map(& &1.body)
  end

  def update(path, params) do
    post(path, params) |> OK.map(& &1.body)
  end

  def delete(path) do
    delete(path) |> OK.map(& &1.body)
  end
end

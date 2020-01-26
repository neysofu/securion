defmodule Securion.Client do
  @moduledoc false

  use Tesla, docs: false

  @secret_key Application.get_env(:securion, :secret_key)
  @rate_limiting Application.get_env(:securion, :rate_limiting)

  plug(Tesla.Middleware.BaseUrl, "https://api.securionpay.com")
  plug(Tesla.Middleware.BasicAuth, username: @secret_key)
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.FormUrlencoded)
  plug(Tesla.Middleware.FollowRedirects)

  if @rate_limiting do
    plug(Securion.Middleware.Delay, delay: 400)
  end
end

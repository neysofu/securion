defmodule Securion.Middleware.Delay do
  @moduledoc false

  @behaviour Tesla.Middleware

  def call(env, next, options) do
    options = Enum.into(options, %{})
    # The poor man's rate limiting middleware. It simply sleeps for a while
    # before making a request.
    Process.sleep(Map.get(options, :delay, 1000))
    Tesla.run(env, next)
  end
end

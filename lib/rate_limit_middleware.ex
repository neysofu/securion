defmodule Securion.RateLimitMiddleware do
  @moduledoc false

  @behaviour Tesla.Middleware
  @duration 500

  def call(env, next, _options) do
    # The poor man's rate limiting middleware. It simply sleeps for a while
    # before making a request.
    Process.sleep(@duration)
    Tesla.run(env, next)
  end
end

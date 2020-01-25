use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :securion,
  # The secret key is mandatory, the public key isn't.
  secret_key: System.get_env("SECURIONPAY_SECRET_KEY"),
  public_key: System.get_env("SECURIONPAY_PUBLIC_KEY"),
  rate_limiting: Mix.env() == :test

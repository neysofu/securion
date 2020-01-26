use Mix.Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :securion,
  secret_key: System.get_env("SECURIONPAY_SECRET_KEY"),
  rate_limiting: Mix.env() == :test

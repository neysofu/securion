# Securion

![Hex version](https://img.shields.io/hexpm/v/securion)
![License](https://img.shields.io/github/license/neysofu/securion)

Elixir client library to the [SecurionPay](https://securionpay.com) payment
gateway REST APIs.

> Please refer to the [docs](https://securionpay.com/docs/api) of the original REST
> APIs when in doubt. This client library is a thin wrapper around it and
> most details are left unchanged.
> However, some API shortcuts (e.g. on-the-go card creation for new
> subscriptions, see the
> [https://securionpay.com/docs/api#subscription-create](docs))
> were removed in favor of simpler, composable APIs.

`securion` doesn't fully cover the original APIs yet, possibly ever. Only
core features are available. Most notably, subscriptions, plans, and events
are _not_ supported.

## Installation

Add `securion` as dependency in `mix.exs`:

```elixir
defp deps do
[
  {:securion, "~> x.y.z"}
]
end
```

## Configuration

You must provide your SecurionPay API secret key. The public key is **not** required.

```elixir
# config/config.exs

config :securion,
  secret_key: "sk_ ..."
```

You should also run your tests with test-only API keys, like so:

```elixir
# config/test.exs

config :securion,
  secret_key: "sk_test_ ..."
```

## Overview

- `Securion.Customer` - Customers APIs.
- `Securion.Card` - Payment cards APIs.
- `Securion.Token` - One-time only tokens for safely handling payment
  cards.
- `Securion.Charge` - Transactions APIs.

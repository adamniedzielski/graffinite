# Graffinite

Get exchange rates from National Bank of Poland.

## Installation

First, add graffinite to your mix.exs dependencies:

```elixir
def deps do
  [{:graffinite, "~> 0.4"}]
end
```

Then, update your dependencies:

```
mix deps.get
```

## Usage

```elixir
date = %Date{day: 2, month: 6, year: 2016}
Graffinite.get_rate(date, "GBP")
# #Decimal<5.6614>
```

If a rate is not available for a given day (because it's Sunday or a public holiday) it returns the previous available rate.

```elixir
date = %Date{day: 12, month: 6, year: 2016}
Graffinite.get_rate(date, "GBP")
# #Decimal<5.5662> (rate from 2016-06-10 because 2016-06-12 is Sunday)
```

defmodule AllCurrenciesTest do
  use ExUnit.Case, async: true

  setup do
    date = %Date{day: 2, month: 6, year: 2016}
    [
      currencies: [
        {:AUD, Decimal.new(2.8320)},
        {:THB, Decimal.new(0.1101)},
        {:BRL, Decimal.new(1.0928)},
        {:BGN, Decimal.new(2.2469)},
        {:CAD, Decimal.new(2.9970)},
        {:CLP, Decimal.new(0.005666)},
        {:CZK, Decimal.new(0.1626)},
        {:DKK, Decimal.new(0.5908)},
        {:EUR, Decimal.new(4.3944)},
        {:HUF, Decimal.new(0.014014)},
        {:HKD, Decimal.new(0.5045)},
        {:UAH, Decimal.new(0.1566)},
        {:ISK, Decimal.new(0.031603)},
        {:INR, Decimal.new(0.058281)},
        {:HRK, Decimal.new(0.5862)},
        {:MYR, Decimal.new(0.9448)},
        {:MXN, Decimal.new(0.2116)},
        {:ILS, Decimal.new(1.0177)},
        {:NZD, Decimal.new(2.6689)},
        {:NOK, Decimal.new(0.4711)},
        {:PHP, Decimal.new(0.0842)},
        {:GBP, Decimal.new(5.6614)},
        {:ZAR, Decimal.new(0.2518)},
        {:RON, Decimal.new(0.9720)},
        {:IDR, Decimal.new(0.00028728)},
        {:RUB, Decimal.new(0.0587)},
        {:SGD, Decimal.new(2.8498)},
        {:SEK, Decimal.new(0.4726)},
        {:CHF, Decimal.new(3.9731)},
        {:TRY, Decimal.new(1.3345)},
        {:USD, Decimal.new(3.9204)},
        {:KRW, Decimal.new(0.003301)},
        {:JPY, Decimal.new(0.035962)},
        {:CNY, Decimal.new(0.5957)},
        {:XDR, Decimal.new(5.5168)},
      ],
      date: date
    ]
  end

  test "get all currency rates for a defined date", context do
    Enum.each(context.currencies, fn({key, value}) ->
      result = Graffinite.get_rate(context.date, key)
      assert result == value
    end)
  end
end

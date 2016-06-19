defmodule GraffiniteGbpCurrencyTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, currency: "GBP"}
  end

  test "get currency rate for first day of year (in fact from last day of the year)", context do
    date_last_day_of_year = %Calendar.Date{day: 31, month: 12, year: 2015}
    date_new_years_day = %Calendar.Date{day: 1, month: 1, year: 2016}
    
    result_for_last_day_of_year = Graffinite.get_rate(date_last_day_of_year, context.currency)
    result_for_new_years_day = Graffinite.get_rate(date_new_years_day, context.currency)
    assert result_for_new_years_day == result_for_last_day_of_year
  end

  test "get currency rate for non-existing date", context do
    date = %Calendar.Date{day: 1, month: 1, year: 1900}
    assert_raise MatchError, fn ->
      Graffinite.get_rate(date, context.currency)
    end
  end
end

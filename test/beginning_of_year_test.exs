defmodule BeginningOfYearTest do
  use ExUnit.Case, async: true

  test "get currency rate for first day of year (in fact from last day of the year)" do
    date_last_day_of_year = %Date{day: 31, month: 12, year: 2015}
    date_new_years_day = %Date{day: 1, month: 1, year: 2016}

    result_for_last_day_of_year = Graffinite.get_rate(date_last_day_of_year, "GBP")
    result_for_new_years_day = Graffinite.get_rate(date_new_years_day, "GBP")
    assert result_for_new_years_day == result_for_last_day_of_year
  end
end

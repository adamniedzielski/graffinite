defmodule GraffiniteTest do
  use ExUnit.Case

  test "get currency rate for a business day" do
    date = %Calendar.Date{day: 2, month: 6, year: 2016}
    result = Graffinite.get_rate(date, "GBP")
    assert result == Decimal.new(5.6614)
  end

  test "get currency rate for Sunday" do
    date = %Calendar.Date{day: 12, month: 6, year: 2016}
    result = Graffinite.get_rate(date, "GBP")
    assert result == Decimal.new(5.5662)
  end
end

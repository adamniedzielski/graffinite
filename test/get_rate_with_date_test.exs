defmodule GetRateWithDateTest do
  use ExUnit.Case

  test "returns the same date for a business day" do
    date = ~D[2016-06-02]
    result = Graffinite.get_rate_with_date(date, "GBP")
    assert result == [rate: Decimal.new(5.6614), date: date]
  end

  test "returns the date of Friday for Sunday" do
    date = ~D[2016-06-12]
    result = Graffinite.get_rate_with_date(date, "GBP")
    assert result == [rate: Decimal.new(5.5662), date: ~D[2016-06-10]]
  end
end

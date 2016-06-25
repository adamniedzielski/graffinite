defmodule MissingDateTest do
  use ExUnit.Case, async: true

  test "get currency rate for non-existing date" do
    date = %Date{day: 1, month: 1, year: 1900}
    assert_raise MatchError, fn ->
      Graffinite.get_rate(date, "GBP")
    end
  end
end

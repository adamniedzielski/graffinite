defmodule Graffinite do
  @api_url "http://api.nbp.pl/api/exchangerates/rates/a/"
  @number_of_days_back 30

  def get_rate(date, currency) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} =
      build_url(date, currency) |> HTTPoison.get

    Poison.decode!(body)["rates"]
      |> List.last
      |> Map.get("mid")
      |> Decimal.new
  end

  defp build_url(date, currency) do
    start_date = date
      |> Calendar.Date.subtract!(@number_of_days_back)
      |> format_date

    end_date = date |> format_date
    "#{@api_url}/#{currency}/#{start_date}/#{end_date}"
  end

  defp format_date(date) do
    Calendar.Strftime.strftime!(date, "%F")
  end
end

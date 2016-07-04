alias Graffinite.MissingRateError

defmodule Graffinite do
  @api_url "http://api.nbp.pl/api/exchangerates/rates/a/"
  @number_of_days_back 30

  def get_rate(date, currency) do
    get_rate_with_date(date, currency)[:rate]
  end

  def get_rate_with_date(date, currency) do
    case date |> build_url(currency) |> HTTPoison.get do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)["rates"]
          |> List.last
          |> process_last_rate
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        raise MissingRateError
    end
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

  defp process_last_rate(%{"mid" => rate, "effectiveDate" => date}) do
    [rate: Decimal.new(rate), date: Date.from_iso8601!(date)]
  end
end

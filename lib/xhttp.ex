defmodule XHTTP do
  @moduledoc """
  `XHTTP` is a library that defines the [Response](`XHTTP.Response`) and
  [ResponseDocument](`XHTTP.ResponseDocument`) protocols.

  For an implementation on top of [Req](https://hex.pm/packages/req)
  see [xhttp_req](https://hex.pm/packages/xhttp_req)
  """

  @doc """
  Parse a HTTP date into a DateTime struct.

  Requires one of the optional dependencies: `:timex`, `http_date`

  Returns `{:ok, datetime}` if input date was parsed successfully, `{:error, :invalid_date}` otherwise.

  ## Examples

      iex> XHTTP.parse_http_date("Mon, 29 Jan 2024 05:29:00 GMT")
      {:ok, ~U[2024-01-29 05:29:00Z]}

      iex> XHTTP.parse_http_date(nil)
      {:error, :invalid_date}

      iex> XHTTP.parse_http_date("Something else")
      {:error, :invalid_date}
  """
  @spec parse_http_date(date :: String.t() | nil) :: {:ok, DateTime.t()} | {:error, :invalid_date}
  def parse_http_date(nil) do
    {:error, :invalid_date}
  end

  def parse_http_date(str_date) do
    cond do
      Code.loaded?(Timex) ->
        apply(Timex, :parse, [str_date, "{RFC1123}"])

      Code.loaded?(HTTPDate) ->
        apply(HTTPDate, :parse, [str_date, validate: false])

      true ->
        raise RuntimeError.exception(
                "No date parser module found. Please install :timex or :http_date as dependency"
              )
    end
    |> case do
      {:ok, date} -> {:ok, date}
      _ -> {:error, :invalid_date}
    end
  end
end

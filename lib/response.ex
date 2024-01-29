defprotocol XHTTP.Response do
  @type header_key() :: String.t() | atom()
  @type header_value_single() :: String.t() | number() | nil
  @type header_value() :: header_value_single() | Enumerable.t(header_value_single())
  @type header() :: {key :: header_key(), value :: header_value()}
  @type status() :: nil | pos_integer()
  @type body() :: nil | binary() | Enumerable.t() | struct()

  @moduledoc """
  The Response protocol provides common functions for retrieving
  data from a HTTP response.

  How exactly that data is retrieved is up to the implementation,
  and the protocol relies on each response consisting of headers and body.
  """
  @spec body(response :: t()) :: body()
  def body(response)

  @doc """
  Retrieve the body in the Response.
  """
  @spec status(response :: t()) :: status()
  def status(response)

  @doc """
  Retrieve the last value for a given header.
  """
  @spec header(response :: t(), header :: String.t(), default :: header_value()) :: header_value()
  def header(response, header, default)

  # Define the header/2 convenience function
  # that invokes implementation header/3 with default = nil
  Kernel.def(header(response, header), do: header(response, header, nil))

  @doc """
  Return an enumerable of headers as `{key, value}` pairs.
  """
  @spec headers(response :: t()) :: Enumerable.t(header())
  def headers(response)

  @doc """
  Checks whether the HTTP response contains the searched header name.
  """
  @spec header_member?(response :: t(), header :: String.t()) :: boolean()
  def header_member?(response, header)
end

defprotocol XHTTP.ResponseDocument do
  @moduledoc """
  The ResponseDocument protocol provides common functions for retrieving
  document data from a HTTP response, such as a HTML, XML or JSON document.

  How exactly that data is retrieved is up to the implementation,
  and the protocol relies on each response containing some basic
  document-like information.
  """

  @type content() :: binary() | struct() | nil | Enumerable.t()

  @doc """
  Retrieve the `Age` header value as a positive integer or zero.
  """
  @spec age(response :: t()) :: non_neg_integer()
  def age(response)

  @doc """
  Retrieve the `Content-Type` header value, `nil` if no such header.
  """
  @spec content_type(response :: t()) :: String.t() | nil
  def content_type(response)

  @doc """
  Retrieve the `Content-Length` header value, `nil` if no such header.
  """
  @spec content_length(response :: t()) :: non_neg_integer() | nil
  def content_length(response)

  @doc """
  Retrieve the `Date` header value as `DateTime.t()`, `nil` if no such header.
  """
  @spec date(response :: t()) :: DateTime.t() | nil
  def date(response)

  @doc """
  Retrieve the `Expires` header value as `DateTime.t()`, `nil` if no such header.
  """
  @spec expires(response :: t()) :: DateTime.t() | nil
  def expires(response)

  @doc """
  Retrieve the body of a HTTP response as document content.
  """
  @spec content(response :: t()) :: content()
  def content(response)

  @doc """
  Retrieve the `Last-Modified` header value as `DateTime.t()`, `nil` if no such header.
  """
  @spec last_modified(response :: t()) :: DateTime.t() | nil
  def last_modified(response)
end

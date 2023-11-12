defmodule TailRecursion do
  @moduledoc """
  Basic tail recursion examples.
  """

  @doc """
  Returns the length of a list.

  ## Examples

      iex> TailRecursion.list_len([1,2,3])
      3

      iex> TailRecursion.list_len([])
      0

  """
  def list_len(list), do: calc_list_len(list, 0)
  defp calc_list_len([], acc), do: acc
  defp calc_list_len([_ | tail], acc), do: calc_list_len(tail, acc + 1)

  @doc """
  Returns a list of all integer numbers in the given range.

  ## Examples

      iex> TailRecursion.range(1,4)
      [1,2,3,4]

  """
  def range(first, last), do: make_range(first, last, [])
  defp make_range(first, last, list) when first > last, do: list
  defp make_range(first, last, list), do: make_range(first, last - 1, [last | list])

  @doc """
  Returns a list of all positvie numbers in a list.

  ## Examples

      iex> TailRecursion.positive([0,1,2,-1,3,4])
      [1,2,3,4]

  """
  def positive(list), do: filter_positive(list, [])
  defp filter_positive([], list), do: Enum.reverse(list)
  defp filter_positive([head | tail], acc) when head > 0, do: filter_positive(tail, [head | acc])
  defp filter_positive([_ | tail], result), do: filter_positive(tail, result)
end

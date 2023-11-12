defmodule NumberHelper do
  @moduledoc """
  Working with numbers.
  """

  @doc """
  Returns sum of all numbers in list.

  ## Examples

      iex> NumberHelper.sum([1,2,3])
      6

      iex> NumberHelper.sum([])
      0

  """
  def sum(enumerable) do
    Enum.reduce(enumerable, 0, &add_number/2)
  end

  defp add_number(num, sum) when is_number(num), do: sum + num
  defp add_number(_, sum), do: sum

  @doc """
  Returns squar root of all numbers in list.

  ## Examples

      iex> NumberHelper.square_root([16, 25, 9, -1, :number])
      "1. sqrt(16) = 4.0"
      "2. sqrt(25) = 5.0"
      :ok

      iex> NumberHelper.square_root([])
      :ok

  """
  def square_root(enumerable) do
    enumerable
    |> Stream.filter(&(is_number(&1) and &1 > 0))
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index()
    |> Enum.each(fn {{input, result}, index} ->
      IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
    end)
  end
end

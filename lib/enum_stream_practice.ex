defmodule EnumStreamPractice do
  @moduledoc """
  Module for practicing working with Enums and Streams
  """

  defp lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim(&1, "\n"))
  end

  @doc """
  Return list of line length of a file

  iex> path = "./assets/file.txt"
  iex> EnumStreamPractice.lines_length!(path)
  [11, 13, 6]
  """
  def lines_length!(path) do
    path
    |> lines!()
    |> Enum.map(&String.length/1)
  end

  @doc """
  Returns the length of the longest line in a file

  iex> path = "./assets/file.txt"
  iex> EnumStreamPractice.longest_line_length!(path)
  13
  """
  def longest_line_length!(path) do
    path
    |> lines_length!()
    |> Enum.max()
  end

  @doc """
  Returns the content of the longest line in a file

  iex> path = "./assets/file.txt"
  iex> EnumStreamPractice.longest_line!(path)
  "1234123123123"
  """
  def longest_line!(path) do
    path
    |> lines!()
    |> Enum.max_by(&String.length/1)
  end

  @doc """
  Returns a list of numbers, with each number representing the
  word count in a file.

  iex> path = "./assets/file.txt"
  iex> EnumStreamPractice.words_per_line!(path)
  [2,1,1]
  """
  def words_per_line!(path) do
    path
    |> lines!()
    |> Enum.map(&word_count/1)
  end

  defp word_count(line) do
    line
    |> String.split()
    |> length()
  end

end

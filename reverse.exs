defmodule MyLists do
  def reverse(list, reversed \\ [])
  def reverse([], reversed), do: reversed
  def reverse(list, reversed) do
    [head | tail] = list
    reverse(tail, [head | reversed])
  end
end

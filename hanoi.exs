defmodule Hanoi do
  def create_state(n) do
    stack = Enum.to_list 1..n
    %{a: stack, b: [], c: []}
  end

  def solve(state) do
    nil
  end

  def move(state, from, to) when from != to do
    {list1, list2} = move_head({state[from], state[to]})
    new_state = %{state | from => list1, to => list2}
    if validate_state(new_state), do: {:ok, new_state}, else: {:error}
  end

  def validate_state(state) do
    %{a: a, b: b, c: c} = state
    results = Enum.map([a,b,c], fn p -> validate_pillar(p) end)
    if Enum.member?(results, :error), do: :error, else: :ok
  end

  defp validate_pillar(list, last \\ nil)
  defp validate_pillar(list = [], last), do: :ok
  defp validate_pillar(list, last = nil) do
    [head | tail] = list
    validate_pillar(tail, head)
  end
  defp validate_pillar(list, last) do
    require IEx
    [head | tail] = list
    IO.inspect(head, label: "head")
    IO.inspect(last, label: "last")
    if last < head do
      validate_pillar(tail, head)
    else
      :error
    end
  end

  defp move_head({list1, list2}) do
    [head | tail] = list1
    {tail, [head | list2]}
  end
end

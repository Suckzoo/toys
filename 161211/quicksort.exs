defmodule Quicksort do
  def sort([]), do: []
  def sort([x]), do: [x]
  def sort(collection) do
    p = hd collection
    c = tl collection
    l = sort(Enum.filter(c, fn(x) -> x <= p end))
    r = sort(Enum.filter(c, fn(x) -> x > p end))
    l ++ [p] ++ r
  end
end

IO.puts Quicksort.sort([1,3,2,4,5,2,3])


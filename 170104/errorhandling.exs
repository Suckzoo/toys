defmodule CustomError do
  defexception message: "bang~"
end

defmodule ErrorThrower do
  def raiseRuntimeError do
    raise "abcd"
  end
  def raiseArgumentError do
    raise ArgumentError, message: "argument error"
  end
  def raiseCustomError do
    raise CustomError, message: 1234
  end
end

try do
  ErrorThrower.raiseCustomError()
rescue
  e in RuntimeError -> e.message |> IO.puts
  e in ArgumentError -> e.message |> IO.puts
  e in CustomError -> e.message |> IO.puts
end


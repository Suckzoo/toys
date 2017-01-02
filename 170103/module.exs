defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name})
  end
end

Example.greeting('Suckzoo') |> IO.puts


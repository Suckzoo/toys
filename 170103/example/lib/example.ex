defmodule Example do
  @moduledoc """
  An example elixir app for newbie programmer
  """
  defmodule User do
    @moduledoc """
    Simple user struct
    """
    defstruct name: "Sean", job: "None"
  end

  @doc """
  Simple greeting function.

  ## Parameters
  - name (string)

  ## Examples
  iex > Example.greet("suckzoo")

  "Hi, suckzoo!"
  """
  @spec hello(String.t) :: (String.t)
  def hello(name) do
    "Hi, " <> name
  end
end

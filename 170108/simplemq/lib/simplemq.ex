defmodule Simplemq do
  use GenServer

  ### GenServer APIs
  @doc """
  GenServer.init/1 callback
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  These callbacks are synchronous callbacks, which handles request right away.
  """
  def handle_call(:dequeue, _from, [value|state]) do
    {:reply, value, state}
  end
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
  def handle_call(:queue, _from, state), do: {:reply, state, state}

  @doc """
  GenServer.handle_cast/2 callback
  These callbacks are asynchronous callbacks.
  """
  def handle_cast({:enqueue, value}, state) do
    {:noreply, state ++ [value]}
  end

  ### Client API / Helper methods
  @doc """
  Start our queue and link it. This is a helper method
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def enqueue(value), do: GenServer.cast(__MODULE__, {:enqueue, value})
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
end

defmodule LoggerHandler do
  use GenEvent

  def handle_event({:msg, msg}, messages) do
    IO.puts "Logging new message: #{msg}"
    {:ok, [msg|messages]}
  end

  def handle_call(:messages, messages) do
    {:ok, Enum.reverse(messages), messages}
  end
end


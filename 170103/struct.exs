defmodule Example.User do
  defstruct name: "Sean", role: []
end

# sean = %Example.User{}
# bob = %Example.User{name: "bob", role: [:admin]}
# alice = %Example.User{bob | name: "alice"}
#
# IO.puts(bob.name)
# IO.puts(alice.name)
# IO.puts(sean.name)

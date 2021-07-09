defmodule MarleySpoon.Parser.Base do
  @callback parse_and_persist(map) :: :ok | {:error, atom}
end

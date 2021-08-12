defmodule ElxproCalculadora do
  def sum(valor), do: GenServer.cast(CalculadoraServer, {:sum, valor})

  def mult(valor), do: GenServer.cast(CalculadoraServer, {:mult, valor})

  def sub(valor), do: GenServer.cast(CalculadoraServer, {:sub, valor})

  def div(valor), do: GenServer.cast(CalculadoraServer, {:div, valor})

  def resultado(), do: GenServer.call(CalculadoraServer, :result)
end

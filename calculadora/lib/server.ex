defmodule Server do
  use GenServer

  def start_link(arg \\ 0), do: GenServer.start_link(__MODULE__, arg, name: CalculadoraServer)

  # OPTS
  def init(arg \\ 0), do: {:ok, arg}

  def handle_cast({:sum, valor}, state), do: {:noreply, state + valor}
  def handle_cast({:mult, valor}, state), do: {:noreply, state * valor}
  def handle_cast({:sub, valor}, state), do: {:noreply, state - valor}
  def handle_cast({:div, valor}, state), do: {:noreply, state / valor}

  def handle_call(:result, from, valor) do
    IO.inspect(from)
    {:reply, valor, valor}
  end
end

defmodule Contas do
  use GenServer

  def init(initial_state) do
    # send(self(), :inicio_conta)
    {:ok, initial_state, {:continue, :inicio_conta}}
  end

  def start_link(state \\ %{}) do
    GenServer.start_link(__MODULE__, state, name: ContasServer)
  end

  def handle_info(:inicio_conta, state) do
    {:noreply, start(state)}
  end

  def handle_continue(:inicio_conta, state) do
    {:noreply, start(state)}
  end

  defp start(state) do
    Process.sleep(10_000)
    Map.put(state, :inicio, DateTime.utc_now())
  end

  def handle_call(:dados, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:buy, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

end

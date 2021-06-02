defmodule ElixtronWeb.ElectronLive do
  use ElixtronWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event("open-browser", _params, socket) do
    IO.puts("Opening browser")
    {
      :noreply,
      socket
      |> push_event("open-browser", %{})
    }
  end
  def handle_event("close-browser", _params, socket) do
    IO.puts("Closing browser")
    {
      :noreply,
      socket
      |> push_event("close-browser", %{})
    }
  end

end

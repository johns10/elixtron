defmodule ElixtronWeb.PageLive do
  use ElixtronWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, url: "")}
  end

  @impl true
  def handle_event("update-link", %{"url" => url}, socket) do
    { :noreply, assign(socket, :url, url)}
  end
end

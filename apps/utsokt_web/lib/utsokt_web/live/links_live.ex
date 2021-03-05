defmodule UtsoktWeb.LinksLive do
  use UtsoktWeb, :live_view

  alias Utsokt.{
    Link
  }

  @impl true
  def mount(_params, _session, socket) do
    Link.subscribe()
    {:ok, get_links(socket)}
  end

  @impl true
  def handle_params(_unsigned_params, _uri, socket) do
    {:noreply, get_links(socket)}
  end

  @impl true
  def handle_info({Link, [:link | _], _}, socket) do
    {:noreply, get_links(socket)}
  end

  # @impl true
  # def handle_event("suggest", %{"q" => query}, socket) do
  #   {:noreply, assign(socket, results: search(query), query: query)}
  # end

  # @impl true
  # def handle_event("search", %{"q" => query}, socket) do
  #   case search(query) do
  #     %{^query => vsn} ->
  #       {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

  #     _ ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:error, "No dependencies found matching \"#{query}\"")
  #        |> assign(results: %{}, query: query)}
  #   end
  # end

  # defp search(query) do
  #   if not UtsoktWeb.Endpoint.config(:code_reloader) do
  #     raise "action disabled when not in development"
  #   end

  #   for {app, desc, vsn} <- Application.started_applications(),
  #       app = to_string(app),
  #       String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
  #       into: %{},
  #       do: {app, vsn}
  # end

  defp get_links(socket) do
    %{live_action: la} = socket.assigns

    case la do
      :archived ->
        assign(socket,
          page_title: gettext("Archived"),
          links: Link.archived(),
          counts: Link.counts()
        )

      _ ->
        assign(socket, page_title: gettext("Unread"), links: Link.unread(), counts: Link.counts())
    end
  end
end

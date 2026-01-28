defmodule AgentOrchLandingWeb.SharedEvents do
  @moduledoc """
  Shared LiveView event handlers for mobile menu toggle and theme switching.
  """

  defmacro __using__(_opts) do
    quote do
      def handle_event("toggle_mobile_menu", _params, socket) do
        {:noreply, assign(socket, :mobile_menu_open, !socket.assigns.mobile_menu_open)}
      end

      def handle_event("toggle_theme", _params, socket) do
        new_theme = if socket.assigns.theme == "dark", do: "light", else: "dark"
        {:noreply, assign(socket, :theme, new_theme)}
      end

      def handle_event("set_theme", %{"theme" => theme}, socket)
          when theme in ["dark", "light"] do
        {:noreply, assign(socket, :theme, theme)}
      end
    end
  end
end

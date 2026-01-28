defmodule AgentOrchLandingWeb.BlogPostLive do
  use AgentOrchLandingWeb, :live_view
  use AgentOrchLandingWeb.SharedEvents

  import AgentOrchLandingWeb.Landing.Navbar
  import AgentOrchLandingWeb.Landing.Footer

  alias AgentOrchLanding.Blog

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    post = Blog.get_post_by_slug!(slug)

    {:ok,
     socket
     |> assign(:mobile_menu_open, false)
     |> assign(:theme, "dark")
     |> assign(:page_title, "#{post.title} — AgentOrch")
     |> assign(:page_description, post.excerpt || String.slice(post.body, 0, 160))
     |> assign(:og_title, "#{post.title} — AgentOrch")
     |> assign(:post, post)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id="theme-root"
      phx-hook="ThemeToggle"
      class="min-h-screen bg-gray-50 dark:bg-gray-950 text-gray-900 dark:text-white"
      data-theme-value={@theme}
    >
      <.navbar mobile_menu_open={@mobile_menu_open} theme={@theme} />
      <div class="pt-16" id="scroll-reveal" phx-hook="ScrollReveal">
        <%!-- Hero featured image --%>
        <div
          :if={@post.featured_image}
          class="relative h-[60vh] min-h-96 w-full overflow-hidden bg-gray-950 bg-cover bg-center"
          style={"background-image: url('#{@post.featured_image}')"}
          role="img"
          aria-label={@post.title}
          data-animate="fade-in"
        >
          <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-gray-950/70 to-gray-950/30">
          </div>
          <div class="absolute inset-x-0 bottom-0 px-6 pb-12 lg:px-8">
            <div class="mx-auto max-w-3xl">
              <a
                href="/blog"
                class="inline-flex items-center text-sm text-white/70 hover:text-white transition-colors mb-6"
              >
                <svg
                  class="w-4 h-4 mr-1"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M15.75 19.5L8.25 12l7.5-7.5"
                  />
                </svg>
                Back to Blog
              </a>
              <h1 class="font-[Space_Grotesk] text-4xl font-bold tracking-tight sm:text-5xl text-white">
                {@post.title}
              </h1>
              <div class="mt-4 flex items-center gap-3 text-sm text-white/70">
                <span>{@post.author}</span>
                <%= if @post.published_at do %>
                  <span>&middot;</span>
                  <time datetime={DateTime.to_iso8601(@post.published_at)}>
                    {Calendar.strftime(@post.published_at, "%B %d, %Y")}
                  </time>
                <% end %>
              </div>
            </div>
          </div>
        </div>

        <%!-- Fallback header when no featured image --%>
        <div :if={!@post.featured_image} class="px-6 py-24 sm:py-32 lg:px-8">
          <div class="mx-auto max-w-3xl">
            <a
              href="/blog"
              class="inline-flex items-center text-sm text-indigo-600 dark:text-indigo-400 hover:text-indigo-500 transition-colors mb-8"
            >
              <svg
                class="w-4 h-4 mr-1"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M15.75 19.5L8.25 12l7.5-7.5"
                />
              </svg>
              Back to Blog
            </a>
            <h1 class="font-[Space_Grotesk] text-4xl font-bold tracking-tight sm:text-5xl bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 dark:from-indigo-400 dark:via-purple-400 dark:to-pink-400 bg-clip-text text-transparent">
              {@post.title}
            </h1>
            <div class="mt-6 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
              <span>{@post.author}</span>
              <%= if @post.published_at do %>
                <span>&middot;</span>
                <time datetime={DateTime.to_iso8601(@post.published_at)}>
                  {Calendar.strftime(@post.published_at, "%B %d, %Y")}
                </time>
              <% end %>
            </div>
          </div>
        </div>

        <article class="px-6 py-16 lg:px-8">
          <div class="mx-auto max-w-3xl">
            <div class="prose prose-lg dark:prose-invert max-w-none prose-headings:font-[Space_Grotesk] prose-a:text-indigo-600 dark:prose-a:text-indigo-400">
              {Phoenix.HTML.raw(render_markdown(@post.body))}
            </div>
          </div>
        </article>
      </div>
      <.footer />
    </div>
    """
  end

  defp render_markdown(nil), do: ""

  defp render_markdown(body) do
    case Earmark.as_html(body) do
      {:ok, html, _} -> html
      {:error, _, _} -> body
    end
  end
end

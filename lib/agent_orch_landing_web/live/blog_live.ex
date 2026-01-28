defmodule AgentOrchLandingWeb.BlogLive do
  use AgentOrchLandingWeb, :live_view
  use AgentOrchLandingWeb.SharedEvents

  import AgentOrchLandingWeb.Landing.Navbar
  import AgentOrchLandingWeb.Landing.Footer

  alias AgentOrchLanding.Blog

  @impl true
  def mount(_params, _session, socket) do
    posts = Blog.list_published_posts()

    {:ok,
     socket
     |> assign(:mobile_menu_open, false)
     |> assign(:theme, "dark")
     |> assign(:page_title, "Blog — AgentOrch")
     |> assign(
       :page_description,
       "Insights on AI agent orchestration, best practices, and industry trends."
     )
     |> assign(:og_title, "Blog — AgentOrch")
     |> assign(:posts, posts)}
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
        <%!-- Hero --%>
        <section class="relative overflow-hidden px-6 py-24 sm:py-32 lg:px-8">
          <div class="absolute inset-0 bg-gradient-to-br from-indigo-50 via-gray-50 to-purple-50 dark:from-indigo-950 dark:via-gray-950 dark:to-purple-950">
          </div>
          <div class="relative mx-auto max-w-3xl text-center" data-animate="hero" data-delay="100">
            <h1 class="font-[Space_Grotesk] text-4xl font-bold tracking-tight sm:text-5xl bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 dark:from-indigo-400 dark:via-purple-400 dark:to-pink-400 bg-clip-text text-transparent">
              Blog
            </h1>
            <p class="mt-6 text-lg leading-8 text-gray-600 dark:text-gray-300">
              Insights on AI agent orchestration, best practices, and industry trends.
            </p>
          </div>
        </section>

        <%!-- Posts --%>
        <section class="px-6 py-16 lg:py-24 lg:px-8">
          <div class="mx-auto max-w-4xl">
            <%= if @posts == [] do %>
              <p class="text-center text-gray-500 dark:text-gray-400">
                No posts yet. Check back soon!
              </p>
            <% else %>
              <div class="space-y-10">
                <article
                  :for={post <- @posts}
                  class="group rounded-2xl bg-white dark:bg-gray-900 p-8 ring-1 ring-gray-200 dark:ring-gray-800 hover:ring-indigo-500/50 transition-all"
                  data-animate="fade-up"
                >
                  <a href={"/blog/#{post.slug}"} class="block">
                    <h2 class="font-[Space_Grotesk] text-2xl font-bold tracking-tight group-hover:text-indigo-600 dark:group-hover:text-indigo-400 transition-colors">
                      {post.title}
                    </h2>
                    <p :if={post.excerpt} class="mt-3 text-gray-600 dark:text-gray-400 leading-7">
                      {post.excerpt}
                    </p>
                    <div class="mt-4 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-500">
                      <span>{post.author}</span>
                      <span>&middot;</span>
                      <time datetime={DateTime.to_iso8601(post.published_at)}>
                        {Calendar.strftime(post.published_at, "%B %d, %Y")}
                      </time>
                    </div>
                  </a>
                </article>
              </div>
            <% end %>
          </div>
        </section>
      </div>
      <.footer />
    </div>
    """
  end
end

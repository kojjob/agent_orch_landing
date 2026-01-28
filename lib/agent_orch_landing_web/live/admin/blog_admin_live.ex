defmodule AgentOrchLandingWeb.Admin.BlogAdminLive do
  use AgentOrchLandingWeb, :live_view

  alias AgentOrchLanding.Blog

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Blog Admin")
     |> assign(:posts, Blog.list_all_posts())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, Blog.list_all_posts())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gray-50 p-8">
      <div class="mx-auto max-w-4xl">
        <div class="flex items-center justify-between mb-8">
          <h1 class="text-3xl font-bold text-gray-900">Blog Admin</h1>
          <a
            href="/admin/blog/new"
            class="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500"
          >
            New Post
          </a>
        </div>

        <table class="min-w-full divide-y divide-gray-200 bg-white rounded-lg shadow">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Title</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Author</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
              <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">
                Actions
              </th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr :for={post <- @posts} class="hover:bg-gray-50">
              <td class="px-6 py-4 text-sm font-medium text-gray-900">{post.title}</td>
              <td class="px-6 py-4 text-sm">
                <%= if post.published_at do %>
                  <span class="inline-flex items-center rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-800">
                    Published
                  </span>
                <% else %>
                  <span class="inline-flex items-center rounded-full bg-yellow-100 px-2.5 py-0.5 text-xs font-medium text-yellow-800">
                    Draft
                  </span>
                <% end %>
              </td>
              <td class="px-6 py-4 text-sm text-gray-500">{post.author}</td>
              <td class="px-6 py-4 text-sm text-gray-500">
                {Calendar.strftime(post.inserted_at, "%B %d, %Y")}
              </td>
              <td class="px-6 py-4 text-right text-sm space-x-3">
                <a href={"/admin/blog/#{post.id}/edit"} class="text-indigo-600 hover:text-indigo-900">
                  Edit
                </a>
                <a
                  phx-click="delete"
                  phx-value-id={post.id}
                  data-confirm="Are you sure?"
                  class="text-red-600 hover:text-red-900 cursor-pointer"
                >
                  Delete
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    """
  end
end

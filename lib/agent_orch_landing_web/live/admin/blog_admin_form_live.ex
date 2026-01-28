defmodule AgentOrchLandingWeb.Admin.BlogAdminFormLive do
  use AgentOrchLandingWeb, :live_view

  alias AgentOrchLanding.Blog
  alias AgentOrchLanding.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :preview_html, "")}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    post = %Post{}
    changeset = Blog.change_post(post)

    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, post)
    |> assign(:form, to_form(changeset))
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    post = Blog.get_post!(id)
    changeset = Blog.change_post(post)

    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, post)
    |> assign(:form, to_form(changeset))
    |> assign(:preview_html, render_markdown(post.body))
  end

  @impl true
  def handle_event("validate", %{"post" => post_params}, socket) do
    changeset =
      socket.assigns.post
      |> Blog.change_post(post_params)
      |> Map.put(:action, :validate)

    preview_html = render_markdown(post_params["body"] || "")

    {:noreply,
     socket
     |> assign(:form, to_form(changeset))
     |> assign(:preview_html, preview_html)}
  end

  @impl true
  def handle_event("save", %{"post" => post_params}, socket) do
    save_post(socket, socket.assigns.live_action, post_params)
  end

  defp save_post(socket, :new, params) do
    params = maybe_set_published_at(params)

    case Blog.create_post(params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post created successfully.")
         |> push_navigate(to: "/admin/blog")}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  defp save_post(socket, :edit, params) do
    params = maybe_set_published_at(params)

    case Blog.update_post(socket.assigns.post, params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post updated successfully.")
         |> push_navigate(to: "/admin/blog")}

      {:error, changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  defp maybe_set_published_at(%{"publish" => "true"} = params) do
    Map.put(
      params,
      "published_at",
      DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_iso8601()
    )
  end

  defp maybe_set_published_at(params) do
    Map.put(params, "published_at", nil)
  end

  defp render_markdown(nil), do: ""
  defp render_markdown(""), do: ""

  defp render_markdown(markdown) do
    case Earmark.as_html(markdown) do
      {:ok, html, _} -> html
      {:error, _, _} -> markdown
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gray-50 p-8">
      <div class="mx-auto max-w-4xl">
        <div class="mb-8">
          <a href="/admin/blog" class="text-sm text-indigo-600 hover:text-indigo-500">
            &larr; Back to posts
          </a>
          <h1 class="mt-2 text-3xl font-bold text-gray-900">{@page_title}</h1>
        </div>

        <.form
          for={@form}
          id="post-form"
          phx-change="validate"
          phx-submit="save"
          class="space-y-6 bg-white p-6 rounded-lg shadow"
        >
          <div>
            <label for="post_title" class="block text-sm font-medium text-gray-700">Title</label>
            <input
              type="text"
              name="post[title]"
              id="post_title"
              value={@form[:title].value}
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
            <.field_errors field={@form[:title]} />
          </div>

          <div>
            <label for="post_slug" class="block text-sm font-medium text-gray-700">
              Slug (auto-generated if blank)
            </label>
            <input
              type="text"
              name="post[slug]"
              id="post_slug"
              value={@form[:slug].value}
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
          </div>

          <div>
            <label for="post_excerpt" class="block text-sm font-medium text-gray-700">Excerpt</label>
            <input
              type="text"
              name="post[excerpt]"
              id="post_excerpt"
              value={@form[:excerpt].value}
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
          </div>

          <div>
            <label for="post_author" class="block text-sm font-medium text-gray-700">Author</label>
            <input
              type="text"
              name="post[author]"
              id="post_author"
              value={@form[:author].value}
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
            />
            <.field_errors field={@form[:author]} />
          </div>

          <div class="grid grid-cols-2 gap-6">
            <div>
              <label for="post_body" class="block text-sm font-medium text-gray-700">
                Body (Markdown)
              </label>
              <textarea
                name="post[body]"
                id="post_body"
                rows="16"
                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm font-mono"
              ><%= @form[:body].value %></textarea>
              <.field_errors field={@form[:body]} />
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700">Preview</label>
              <div class="mt-1 prose prose-sm max-w-none p-4 border rounded-md bg-gray-50 min-h-[24rem] overflow-auto">
                {Phoenix.HTML.raw(@preview_html)}
              </div>
            </div>
          </div>

          <div class="flex items-center gap-2">
            <input type="hidden" name="post[publish]" value="false" />
            <input
              type="checkbox"
              name="post[publish]"
              id="post_publish"
              value="true"
              checked={not is_nil(@form[:published_at].value)}
              class="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
            />
            <label for="post_publish" class="text-sm font-medium text-gray-700">Publish</label>
          </div>

          <div class="flex gap-3">
            <button
              type="submit"
              class="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500"
            >
              Save
            </button>
            <a
              href="/admin/blog"
              class="rounded-md bg-white px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-gray-300 hover:bg-gray-50"
            >
              Cancel
            </a>
          </div>
        </.form>
      </div>
    </div>
    """
  end

  defp field_errors(assigns) do
    ~H"""
    <p :for={msg <- Enum.map(@field.errors, &format_error/1)} class="mt-1 text-sm text-red-600">
      {msg}
    </p>
    """
  end

  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end

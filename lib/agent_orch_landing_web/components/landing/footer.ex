defmodule AgentOrchLandingWeb.Landing.Footer do
  use Phoenix.Component

  def footer(assigns) do
    ~H"""
    <footer id="footer" class="bg-gray-50 dark:bg-gray-900 border-t border-gray-200 dark:border-gray-800/50">
      <div class="mx-auto max-w-7xl px-6 py-16 lg:px-8">
        <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
          <%!-- Brand Column --%>
          <div>
            <span class="text-xl font-bold bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">
              AgentOrch
            </span>
            <p class="mt-3 text-sm text-gray-500 dark:text-gray-400">
              The orchestration platform for AI agent teams.
            </p>
            <div class="mt-4 flex gap-4">
              <a href="https://github.com/agentorch" class="text-gray-400 dark:text-gray-500 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="GitHub">
                <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/></svg>
              </a>
              <a href="https://twitter.com/agentorch" class="text-gray-400 dark:text-gray-500 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="Twitter">
                <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
              </a>
              <a href="https://linkedin.com/company/agentorch" class="text-gray-400 dark:text-gray-500 hover:text-gray-600 dark:hover:text-gray-300 transition-colors" aria-label="LinkedIn">
                <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
              </a>
            </div>
          </div>

          <%!-- Product Column --%>
          <div>
            <h3 class="text-sm font-semibold text-gray-900 dark:text-white">Product</h3>
            <ul class="mt-4 space-y-3">
              <li><a href="#solution" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Features</a></li>
              <li><a href="#pricing" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Pricing</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Roadmap</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Changelog</a></li>
            </ul>
          </div>

          <%!-- Company Column --%>
          <div>
            <h3 class="text-sm font-semibold text-gray-900 dark:text-white">Company</h3>
            <ul class="mt-4 space-y-3">
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">About</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Blog</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Careers</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Contact</a></li>
            </ul>
          </div>

          <%!-- Legal Column --%>
          <div>
            <h3 class="text-sm font-semibold text-gray-900 dark:text-white">Legal</h3>
            <ul class="mt-4 space-y-3">
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Privacy Policy</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Terms of Service</a></li>
              <li><a href="#" class="text-sm text-gray-500 dark:text-gray-400 hover:text-gray-900 dark:hover:text-white transition-colors">Cookie Policy</a></li>
            </ul>
          </div>
        </div>

        <%!-- Bottom Bar --%>
        <div class="mt-12 border-t border-gray-200 dark:border-gray-800/50 pt-8 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p class="text-sm text-gray-500">© 2026 AgentOrch. All rights reserved.</p>
          <p class="text-sm text-gray-500">Built with Elixir &amp; Phoenix</p>
        </div>
      </div>
    </footer>
    """
  end
end

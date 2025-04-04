-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- { import = "astrocommunity.ai.kurama622-llm-nvim"};

  { import = "astrocommunity.code-runner.compiler-nvim" },

  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  --   { import = "astrocommunity.editing-support.quick-scope"},

  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  -- { import = "astrocommunity.file-explorer.mini-files" },

  { import = "astrocommunity.git.neogit" },
  --   { import = "astrocommunity.indent.indent-rainbowline"}; -- выдает ошибку

  { import = "astrocommunity.motion.leap-nvim" },

  { import = "astrocommunity.pack.cs-omnisharp" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  --   { import = "astrocommunity.pack.godot"}; -- выдает ошибку

  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.auto-session-restore" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },

  { import = "astrocommunity.split-and-window.neominimap-nvim" },
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },
  --   { import = "astrocommunity.split-and-window.edgy-nvim" }, -- из-за него глючит neo-tree

  -- { import = "astrocommunity.terminal-integration.vim-tpipeline" },
  --   { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- import/override with your plugins folder
}

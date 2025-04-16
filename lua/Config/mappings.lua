-- ~/.config/nvim/lua/user/mappings.lua

---@type LazyKeysSpec[]
return {
  -- Режим Normal, запуск компилятора
  {
    "<F8>",
    ":CompilerOpen<CR>",
    desc = "Run Compiler",
    mode = "n",
  },

  -- hover.nvim
  {
    "K",
    function() require("hover").hover() end,
    desc = "hover.nvim: Показать информацию при наведении",
    mode = "n",
  },
  {
    "gK",
    function() require("hover").hover_select() end,
    desc = "hover.nvim: Выбрать источник информации",
    mode = "n",
  },
  {
    "<C-n>",
    function() require("hover").hover_switch "next" end,
    desc = "hover.nvim: Следующий источник",
    mode = "n",
  },

  -- easy-dotnet
  {
    "<C-p>",
    function()
      local ok, easy_dotnet = pcall(require, "easy-dotnet")
      if ok then
        easy_dotnet.run_project()
      else
        print "Easy-dotnet не загружен"
      end
    end,
    desc = "easy-dotnet: Запустить проект",
    mode = "n",
  },

  -- Примеры: если захочешь использовать их
  -- {
  --   "<leader>y",
  --   '"+y',
  --   desc = "Скопировать в системный буфер",
  --   mode = "v",
  -- },
  -- {
  --   "<C-s>",
  --   "<Esc>:w<CR>",
  --   desc = "Сохранить файл",
  --   mode = "i",
  -- },
}

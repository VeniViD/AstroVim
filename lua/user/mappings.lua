---@type LazyKeysSpec[]
return {
  n = {
    {
      "<F8>",
      ":CompilerOpen<CR>",
      desc = "Run Compiler",
    },
    {
      "K",
      function() require("hover").hover() end,
      desc = "hover.nvim: Показать информацию при наведении",
    },
    {
      "gK",
      function() require("hover").hover_select() end,
      desc = "hover.nvim: Выбрать источник информации",
    },
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
    },
    {
      "<C-n>",
      function() require("hover").hover_switch "next" end,
      desc = "hover.nvim: Следующий источник",
    },
  },
}

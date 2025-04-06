local dap_dotnet = require "user.dap_dotnet"
dap_dotnet.register_net_dap()

return {
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require "dap"
      if not dap.adapters["netcoredbg"] then
        require("dap").adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath "netcoredbg",
          args = { "--interpreter=vscode" },
          -- console = "internalConsole",
        }
      end

      local dotnet = require "easy-dotnet"
      local debug_dll = nil
      local function ensure_dll()
        if debug_dll ~= nil then return debug_dll end
        local dll = dotnet.get_debug_dll()
        debug_dll = dll
        return dll
      end

      for _, lang in ipairs { "cs", "fsharp", "vb" } do
        dap.configurations[lang] = {
          {
            log_level = "DEBUG",
            type = "netcoredbg",
            justMyCode = false,
            stopAtEntry = false,
            name = "Default",
            request = "launch",
            env = function()
              local dll = ensure_dll()
              local vars = dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
              return vars or nil
            end,
            program = function()
              require("overseer").enable_dap()
              local dll = ensure_dll()
              return dll.relative_dll_path
            end,
            cwd = function()
              local dll = ensure_dll()
              return dll.relative_project_path
            end,
            preLaunchTask = "Build .NET App With Spinner",
          },
        }

        dap.listeners.before["event_terminated"]["easy-dotnet"] = function() debug_dll = nil end
      end
    end,
    keys = {
      { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
      -- HYDRA MODE
      -- NOTE: the delay is set to prevent the which-key hints to appear
      {
        "<leader>d<space>",
        function() require("which-key").show { delay = 1000000000, keys = "<leader>d", loop = true } end,
        desc = "DAP Hydra Mode (which-key)",
      },
      {
        "<leader>dR",
        function()
          local dap = require "dap"
          local extension = vim.fn.expand "%:e"
          dap.run(dap.configurations[extension][1])
        end,
        desc = "Run default configuration",
      },
      {
        "<leader>dB",
        function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue",
      },
      {
        "<leader>da",
        function() require("dap").continue { before = get_args } end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function() require("dap").goto_() end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function() require("dap").down() end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function() require("dap").up() end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function() require("dap").run_last() end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function() require("dap").step_out() end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function() require("dap").step_over() end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function() require("dap").pause() end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function() require("dap").session() end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function() require("dap").terminate() end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function() require("dap.ui.widgets").hover() end,
        desc = "Widgets",
      },
    },
  },
}

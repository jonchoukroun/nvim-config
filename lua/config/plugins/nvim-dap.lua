return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()

		local dap = require("dap")
		local dapui = require("dapui")
		dap.adapters.lldb = {
			type = "executable",
			command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	event = "VeryLazy",
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "DAP: Toggle Breakpoint" },
		{ "<leader>dr", "<cmd>DapContinue<CR>", desc = "DAP: Run" },
		{ "<leader>dt", "<cmd>DapTerminate<CR>", desc = "DAP: Terminate" },
		{ "<leader>ds", "<cmd>DapStepOver<CR>", desc = "DAP: Step Over" },
		{ "<leader>di", "<cmd>DapStepInto<CR>", desc = "DAP: Step Into" },
		{ "<leader>do", "<cmd>DapStepOut<CR>", desc = "DAP: Step Out" },
	},
}

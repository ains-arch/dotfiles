-- configures neo-tree for file explorer
return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
    require("neo-tree").setup(
      {filesystem = {
        filtered_items = {
          visible = true,
        }
      }
    }
    )
		vim.keymap.set("n", "<leader>t", ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
	end
}

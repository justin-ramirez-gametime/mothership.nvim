-- Catppuccin color scheme
vim.cmd.colorscheme "catppuccin-macchiato"

-- Fugitive keymap
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);	

-- Harpoon plugins and keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-u>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-i>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)

-- Telescope plugin and keymap
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>jf', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<leader>js', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- NVIM-Tree plugin and keymap
local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
	vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
	---
	on_attach = my_on_attach,
	---
}

-- Treesitter config
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "sql", "rust", "python", "json", "java" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI insrequire'nvim-treesitter.configs'.setup {}
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "sql", "rust", "python", "json", "java" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Undotree keymap
vim.keymap.set('n', '<leader>u', require('undotree').toggle, 
{ noremap = true, silent = true })

-- lualine config
require('lualine').get_config()
require('lualine').setup{
	options = { 
		theme = 'dracula',
		globalstatus = false,
		sections = {
			lualine_a = {
				{
					'filename',
					file_status = true,      -- Displays file status (readonly status, modified status)
					newfile_status = false,  -- Display new file status (new file means no write after created)
					path = 2,                -- 0: Just the filename
								 -- 1: Relative path
								 -- 2: Absolute path
								 -- 3: Absolute path, with tilde as the home directory
								 -- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
								 -- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = '[+]',      -- Text to show when the file is modified.
						readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
						unnamed = '[No Name]', -- Text to show for unnamed buffers.
						newfile = '[New]',     -- Text to show for newly created file before first write
					}
				}
			}
		}
	}
}

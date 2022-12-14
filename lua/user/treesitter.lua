local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- makes C compiler work, don't know how
require'nvim-treesitter.install'.compilers = {"musl-gcc"}
require'nvim-treesitter.parsers'.command_extra_args = {["musl-gcc"] = {"-static"}}
-- end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.twig = "html" -- make twig file use html parser

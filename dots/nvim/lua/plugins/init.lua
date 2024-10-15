return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},

	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", desc = "leap forward to" },
			{ "S", desc = "leap backward to" },
			{ "gs", desc = "leap from window" },
		},
		config = function()
			require("leap").add_default_mappings()
		end,
	},

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}

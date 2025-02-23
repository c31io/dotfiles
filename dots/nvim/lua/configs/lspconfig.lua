local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

nvlsp.defaults()

local servers = { "rust_analyzer" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = nvlsp.on_init,
		on_attach = function (client, bufnr)
		  nvlsp.on_attach(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
      end
		end,
		capabilities = nvlsp.capabilities,
	})
end

lspconfig.lua_ls.setup({
	on_init = nvlsp.on_init,
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

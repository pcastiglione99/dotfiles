return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff", "isort", "black" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					c = { "clang-format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters = {
					["clang-format"] = {
						prepend_args = {
							"--style={BasedOnStyle: Google, IndentWidth: 4}",
						},
					},
				},
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				conform.format({
					async = true,
					lsp_format = "fallback",
					range = range,
				})
			end, { range = true })
		end,
	},
}

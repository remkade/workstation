function config()
	require("codecompanion").setup({
		display = {
			action_palette = { provider = "telescope" },
		},
		strategies = {
			chat = { adapter = "qwen3coder" },
			inline = { adapter = "qwen3coder" },
		},
		adapters = {
			http = {
				phi4 = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "phi4",
						schema = {
							model = { default = "phi4:latest" },
							num_ctx = { default = 16384 },
							num_predict = { default = -1 },
						},
					})
				end,
				qwen3coder = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "qwen3coder",
						schema = {
							model = { default = "qwen3-coder:30b" },
							num_ctx = { default = 131072 },
							num_predict = { default = -1 },
						},
					})
				end,
				deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek",
						schema = {
							model = { default = "deepseek-r1:32b" },
							num_ctx = { default = 128000 },
							num_predict = { default = -1 },
						},
					})
				end,
			},
		},
	})
end

return { config = config }

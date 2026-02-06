function config()
	require("codecompanion").setup({
		display = {
			action_palette = { provider = "telescope" },
		},
		strategies = {
			chat = { adapter = "devstral2" },
			inline = { adapter = "devstral2" },
			cmd = { adapter = "devstral2" },
			background = { adapter = "devstral2" },
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
				devstral2 = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "devstral2",
						schema = {
							model = { default = "devstral-small-2:24b" },
							num_ctx = { default = 262144 },
							num_predict = { default = -1 },
						},
					})
				end,
			},
		},
	})
end

return { config = config }

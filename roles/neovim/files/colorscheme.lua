function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	"OceanicNext",
	"edge",
	"everforest",
	"nekonight-deep-ocean",
	"nekonight-mars",
	"nekonight-material-theme",
	"nekonight-night",
	"nekonight-noctis-uva",
	"nekonight-nord",
	"nekonight-onedark",
	"nekonight-storm",
	"onenord",
	"sonokai",
	"sorbet",
	"tokyonight-night",
}

local scheme = randomObjectFromTable(schemes)

vim.cmd("colorscheme " .. scheme)

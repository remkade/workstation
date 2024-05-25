function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	'OceanicNext',
	'atomified',
	'candid',
	'cryslominsa',
	'deus',
	'edge',
	'flattown',
	'focuspoint',
	'hybrid',
	'nord',
	'onenord',
	'plastic',
	'sonokai',
	'spring-night',
        'tokyonight-night'
}

local scheme = randomObjectFromTable(schemes)

vim.cmd('colorscheme ' .. scheme)

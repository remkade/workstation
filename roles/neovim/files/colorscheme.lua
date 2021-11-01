function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	'OceanicNext',
	'atomified',
	'blayu',
	'candid',
	'cryslominsa',
	'deus',
	'duoduo',
	'edge',
	'flattown',
	'focuspoint',
	'hybrid',
	'nord',
	'onenord',
	'plastic',
	'sonokai',
	'spring-night',
	'wallaby',
        'forest-night'
}

local scheme = randomObjectFromTable(schemes)

vim.cmd('colorscheme ' .. scheme)

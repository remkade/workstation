function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	'OceanicNext',
	'candid',
	'cryslominsa',
	'hybrid',
	'onenord',
	'plastic',
	'sonokai',
	'spring-night',
        'tokyonight-night'
}

local scheme = randomObjectFromTable(schemes)

vim.cmd('colorscheme ' .. scheme)

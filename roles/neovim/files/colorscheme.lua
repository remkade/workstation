function randomObjectFromTable(t)
	return t[math.random(1, #t)]
end

local schemes = {
	'candid',
	'onenord',
	'sonokai',
	'spring-night',
        'tokyonight-night',
	'nekonight-night',
	'nekonight-mars',
	'nekonight-onedark',
	'nekonight-nord',
}

local scheme = randomObjectFromTable(schemes)

vim.cmd('colorscheme ' .. scheme)

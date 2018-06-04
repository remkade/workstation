function genpass
	env LC_ALL=C tr -dc 'a-zA-Z0-9+_-&%^' < /dev/urandom | fold -w 32 | head -n 1
end

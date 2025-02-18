function upgrade --description 'upgrade the system'
	if which emerge
		systemd-inhibit --why 'Syncing portage' sudo emerge --sync
		and systemd-inhibit --why 'Updating system' sudo emerge -av --update --keep-going --backtrack=40 --newuse --deep --with-bdeps=y @world
		and systemd-inhibit --why 'Dep clean' sudo emerge -av --depclean
	else if which brew
		brew upgrade
	else if which apt
		sudo apt update; and sudo apt upgrade
	end

	rustup update
end

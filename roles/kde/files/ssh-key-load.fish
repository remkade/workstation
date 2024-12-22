#!/usr/bin/env fish
# Load all the ssh-keys

set -x SSH_ASKPASS (which ksshaskpass)
for key in $HOME/.ssh/id_{ed25519,rsa}
	ssh-add $key
end

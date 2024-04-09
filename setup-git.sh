#!/bin/bash
cd ~
mkdir installs
cd installs
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.4.1/gcm-linux_amd64.2.4.1.deb
sudo dpkg -i gcm-linux_amd64.2.4.1.deb
git-credential-manager configure

echo '[credential]
    # helper = 
	helper = /usr/local/bin/git-credential-manager
    credentialStore = gpg
[credential "https://dev.azure.com"]
	useHttpPath = true' > ~/.gitconfig

gpg --gen-key | sed -n '2 p' | sed 's/^[[:space:]]*//g' | xargs pass init

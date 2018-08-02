#!/bin/sh

fancy_echo() {
    local fmt="$1"; shift

    # shellcheck disable=SC2059
    printf "\n$fmt\n" "$@"
}

fancy_echo "Installing git"
sudo apt install -y git

fancy_echo "Installing oh-my-zsh"
# Source: https://gist.github.com/tsabat/1498393
sudo apt install -y zsh
wget https://github.com/robbyrussel/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`


# fancy_echo "Setting up Github SSH"
# echo "Please enter your github email."
# read github_email
# ssh-keygen -t rsa -b 4096 -C $github_email

# fancy_echo "Copying SSH key to your clipboard"
# pbcopy < ~/.ssh/github.pub

fancy_echo "Add key to github to finish setup."
echo "Press enter to open instructions."
read throwaway_input
open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

fancy_echo "System need to reboot for zsh"
fancy_echo "use 'sudo shutdown -r 0' to do so now"

#!/bin/sh

fancy_echo() {
    local fmt="$1"; shift

    # shellcheck disable=SC2059
    printf "\n$fmt\n" "$@"
}

fancy_echo "Installing git, curl zsh"
sudo apt install -y git curl zsh

fancy_echo "Installing oh-my-zsh"
# Source: https://gist.github.com/tsabat/1498393
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Changing to zsh with chsh, may require prompt"
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
xdg-open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

fancy_echo "System need to reboot for zsh"
fancy_echo "use 'sudo shutdown -r 0' to do so now"

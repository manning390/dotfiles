# FZF+WordNet = Dictionary
# https://ddrscott.github.io/blog/2017/fzf-dictionary/
# Default `fold` to screen width and break at spaces
function fold {
	if [ $# -eq 0 ]; then
		/usr/bin/fold -w $COLUMNS -s
	else
		/usr/bin/fold $*
	fi
}

# Default `fzf` against system dictionary
# Requires:
# sudo apt install wamerican
function spell {
	\cat ~/.dotfiles/wordnet.txt | fzf --preview 'wn {} -over | fold' --preview-window=up:60%
}

# Lookup definition of word using `wn $q -over`
# If #q is not provided, we'll use the `spell` command to pick a word.
# Requires:
# sudo apt install wordnet
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
# Or install fzf via nvim plugin (:PlugInstall), check ;vp
function dict {
	if [ $# -eq 0 ]; then
		wn `spell` -over | fold
	else
		wn $1 -over | fold
	fi
}


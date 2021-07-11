# dotfiles
Configs, setups, etc

## New Mac Setup
Type speed: `defaults write NSGlobalDomain KeyRepeat -int 1` with KeyRepeat set to -3 and Delay to fastest in settings.
Scroll speed: fastest in settings.
Dock speed: `defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock`

Install vim plugin manager:
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

# dotfiles
Configs, setups, etc

## New Mac Setup
Type speed: `defaults write NSGlobalDomain KeyRepeat -int 1` with KeyRepeat set to -3 and Delay to slowest in settings. (more settings: `defaults write -g InitialKeyRepeat -int 10`)
Scroll speed: fastest in settings.
Repeat keys turn on: `defaults write -g ApplePressAndHoldEnabled -bool false`
Dock speed: `defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock`

### M1
Install jax according to [this](https://github.com/google/jax/issues/5501#issuecomment-903915155) and [this](https://github.com/google/jax/issues/5501#issuecomment-881337136) (resulting wheel is "jaxlib-0.1.70-cp39-none-macosx_11_0_arm64.whl"), so it doesn't look like a x86)
```
% git clone https://github.com/google/jax
% cd jax
% python build/build.py
% pip install dist/*.whl
% pip install -e .
```
Or update jax first then `pip install jax[cpu] -f https://storage.googleapis.com/jax-releases/jax_releases.html`
Install scipy: https://github.com/scipy/scipy/issues/13409#issuecomment-824919738
Homebrew install: `% arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

Install vim plugin manager:
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
or [Vundle](https://github.com/VundleVim/Vundle.vim)
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
For YCM:
```
brew install macvim # optional 
brew install cmake python go nodejs
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-interpreter # no need --all
```
Add to `.vimrc` (may need to `brew install vim` for python3+ support)
```
" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'
```
Then `:wq` to exit, reopen vim and run:
- Delete plugin: `:PluginUpdate`
- Add plugin: `:PluginInstall`

## References
[vundle](https://www.jianshu.com/p/f0513d18742a)

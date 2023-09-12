# dotfiles
Configs, setups, etc

## New Mac Setup
Type speed: `defaults write NSGlobalDomain KeyRepeat -int 1` with KeyRepeat set to -3 and Delay to slowest in settings. (more settings: `defaults write -g InitialKeyRepeat -int 10`)
Scroll speed: fastest in settings.
Repeat keys turn on: `defaults write -g ApplePressAndHoldEnabled -bool false`
Dock speed: `defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock`

### M1/2
Install homebrew and zsh
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/winniexu/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/winniexu/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```
Set up [`tmux`](https://github.com/gpakosz/.tmux) and `brew install reattach-to-user-namespace`

Install jax according to [this](https://github.com/google/jax/issues/5501#issuecomment-903915155) and [this](https://github.com/google/jax/issues/5501#issuecomment-881337136) (resulting wheel is "jaxlib-0.1.70-cp39-none-macosx_11_0_arm64.whl"), so it doesn't look like a x86)
```
% git clone https://github.com/google/jax
% cd jax
% python build/build.py
% pip install dist/*.whl
% pip install -e . # or, pip install /Users/winniexu/jax/dist/jaxlib-0.3.21-cp310-cp310-macosx_11_0_arm64.whl
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

Install python: `brew install python`

For YCM:
```
brew install macvim # optional, make sure no conflicts with regular vim which may also be aliased -- unlink one of em
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

Install [wget](https://blog.eldernode.com/install-and-use-tmux-on-macos/)

## Research
Bash install: [Miniconda](https://docs.conda.io/en/latest/miniconda.html)

Tmux install: [oh my tmux](https://github.com/gpakosz/.tmux)
- but if want my basic config, just cp .tmux.conf to $HOME

## References
[vundle](https://www.jianshu.com/p/f0513d18742a)

Request interactive shell on slurm:
```
srun --time=02:00:00 --partition=atlas --gres=gpu:1 --mem=8G --cpus-per-task=4 --pty bash
```

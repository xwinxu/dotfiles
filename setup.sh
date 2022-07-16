#!/bin/bash

cd $HOME
git clone https://github.com/xwinxu/dotfiles.git && cp dotfiles/.bashrc .bashrc && cp dotfiles/.vimrc .vimrc && cp dotfiles/.tmux.conf .tmux.conf && source ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

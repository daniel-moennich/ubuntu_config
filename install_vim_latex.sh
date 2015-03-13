#!/bin/bash

sudo apt-get install vim vim-latexsuite

# Activate the latex-suite plugin
vim-addons install latex-suite

# Adjust .vimrc file to create pdf files with latex-suite, etc.

if [ -f ~/.vimrc ]
then
	echo ".vimrc file already exists. The following changes need to be done manually."
	exit 1
fi

cat <<EOF > ~/.vimrc
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
EOF

echo ":help latex-suite"

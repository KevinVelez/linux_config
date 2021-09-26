"
" Copyright (C) 2021 Kevin Velez
"
" Archivo de configuración de nvim.

" Configuraciones globales de vim.
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode

" Pluggins.
call plug#begin('~/.config/nvim/plugged')

" Tema
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
" Tree
Plug 'scrooloose/nerdtree'

" Navegacion
Plug 'christoomey/vim-tmux-navigator'

"
Plug 'terryma/vim-multiple-cursors' 

call plug#end()

" Configuración del temam (gruvbox).
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Cerrar nerdtree al abrir archivo.
let NERDTreeQuitOnOpen=1

" Tecla lider 'space'.
let mapleader=" "

" Atajos de teclado simples.

" Lider + s : buscador por dos caracteres.
nmap <Leader>f <Plug>(easymotion-s2)

" Lider + t : abrir nerdtree
nmap <Leader>t :NERDTreeFind<CR>

" Lider + w : guardar archivo.
nmap <Leader>w :w<CR>

" Lider + q : cerrar archivo.
nmap <Leader>q :q<CR>

" Lider + Q : forzar cerrar archivo.
nmap <Leader>Q :q!<CR>


" Para ejecutar comandos desde neovim.
command! MakeTags !ctags -R .

" Revisión ortografica en español.
nmap <F6> :setlocal spell! spelllang=es<CR>

" Detectar archivos de groff.
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

" Compilación de groff a pdf
" <F5> sin imágenes.
autocmd Filetype groff map <F5> :!groff<space>-ms<space><C-r>%<space>-k<space>-e<space>-t<space>-T<space>pdf<space>><space><C-r>%<backspace><backspace>pdf<Enter><Enter>
" <F7> con imágenes
autocmd Filetype groff map <F7> :!groff<space>-ms<space>-k<space>-e<space>-t<space>-Tps<space><C-r>%<space>\|<space>ps2pdf<space>-<space><C-r>%<backspace><backspace>pdf<CR><CR>

" Compilar LaTeX a pdf
" <F5> pdflatex
autocmd FileType tex map <F5> :!pdflatex<space><c-r>%<CR><CR>
" <F7> xelatex
autocmd FileType tex map <F7> :!xelatex<space><c-r>%<CR><CR>
" <F8> bibtex
autocmd FileType tex map <F8> :!bibtex<space><c-r>%<backspace><backspace><backspace><backspace><CR><CR>


" Abrir el pdf usando llpp
autocmd FileType tex nmap <leader>p :!llpp <c-r>%<backspace><backspace><backspace>pdf & <CR><CR>
autocmd FileType groff nmap <leader>p :!llpp <c-r>%<backspace><backspace>pdf & <CR><CR>

" Navegar por las guias.
" map <Space><Tab> <Esc>/<++><Enter>"_c4l
nmap <Space><Tab> /<++><CR>c4l


" Atajos en LaTeX
autocmd FileType tex nmap <Leader>b i\begin{dev}<CR><++><CR>\end{dev}<Esc><Esc>2k0fd<C-n><C-n>c
autocmd FileType tex nmap <Leader>m a$<space><space>$<Esc><Esc>hi
autocmd FileType tex nmap <Leader>M a\[<space><space>\]<Esc><Esc>2hi

autocmd FileType html nmap <Leader><CR> i<!DOCTYPE html><CR><html lang="es"><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html><Esc><Esc>gg
autocmd FileType html nmap <Leader>h1 i<h1><space><++><space></h1><Esc><Esc>0
autocmd FileType html nmap <Leader>h2 i<h2><space><++><space></h2><Esc><Esc>0
autocmd FileType html nmap <Leader>h3 i<h3><space><++><space></h3><Esc><Esc>0
autocmd FileType html nmap <Leader>h4 i<h4><space><++><space></h4><Esc><Esc>0
autocmd FileType html nmap <Leader>h5 i<h5><space><++><space></h5><Esc><Esc>0
autocmd FileType html nmap <Leader>h6 i<h6><space><++><space></h6><Esc><Esc>0

autocmd FileType html nmap <Leader>l ya<<Esc>f>a<space><++><space><Esc><Esc>pF<a/<Esc><Esc>
autocmd FileType html nmap <Leader>b ya<<Esc>f>pF<a/<Esc><Esc>F<i<CR><Esc><Esc>O<++><Esc><Esc>


# fzz.vim

This plugin makes it easy to use [fzz](https://www.github.com/mrnugget/fzz) as
an interactive search in Vim. Per default it uses
[the_silver_searcher](https://github.com/ggreer/the_silver_searcher) (ag) to
search through files.

## Installation

If you have [pathogen.vim](https://github.com/tpope/vim-pathogen) you can
install this plugin pretty easily:

```
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-surround.git
```

## Usage

Just use the `:Fzz` command to search through files.

```
:Fzz mykeyword1 mykeyword2
```

This will use `mykeyword1 mykeyword2` as the initial values passed to `fzz` and
`ag`.

Use `:Fzz` to search in a directory:

```
:Fzz mykeyword1 mykeyword2 ~/code/fzz
```

This will use `mykeyword1 mykeyword2` as the initial values passed to `fzz` and
`ag` and search in `~/code/fzz`.

## License

Copyright (c) Thorsten Ball. Using the same license/terms as Vim itself. For
more information: `:help license`.

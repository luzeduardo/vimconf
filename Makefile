URL ?= 'http://vim-bootstrap.com/generate.vim'
LANGS ?= 'langs=c&langs=elixir&langs=erlang&langs=html&langs=javascript&langs=lua&langs=perl&langs=php&langs=python&langs=rust&langs=scala&editor=vim'
VIMRC ?= bootstrap.vimrc

bootstrap-vim:
	curl $(URL) --data $(LANGS) > $(VIMRC)
	
fonts:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

fullinstall: clean bootstrap-vim
	cp $(VIMRC) ~/.vimrc
	cp local.vimrc ~/.vimrc.local
	cp local.vimrc.bundles ~/.vimrc.local.bundles
	
install: clean
	cp $(VIMRC) ~/.vimrc
	cp local.vimrc ~/.vimrc.local
	cp local.vimrc.bundles ~/.vimrc.local.bundles

vimrc:
	cp $(VIMRC) ~/.vimrc
	cp local.vimrc ~/.vimrc.local

clean:
	rm -Rf ~/.vim*

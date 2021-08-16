# .files

This repo contains configuration files for console and text editor and a script that creates soft links for those.
Made within a Ubuntu 21.04 enviroment, untested in any other.

Includes configs for:
* [ZSH](https://ohmyz.sh/)
* [NeoVim](https://neovim.io/)
* [Tmux](https://github.com/tmux/tmux/wiki)


## Script

Just run `. ./link-me-softly.sh` to create soft links to these configs. 
Old links will be replaced, but you will be asked first. 
Existing files will be renamed as `.backup` and a soft link will take the original's place.

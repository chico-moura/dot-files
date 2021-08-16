#!/usr/bin/bash

# soft links target path
path_zshrc=$HOME
path_tmux_conf=$HOME
path_nvim=$HOME/.config/nvim

# dot-files path
path_dot_files=$(dirname $(readlink -f $0))

# flags
auto_confirm=false

run()
{
	case $# in
		0) link_all ;;
		1) case $1 in
			-h) echo_help ;;
			--help) echo_help ;;
			-y) auto_confirm=true; link_all ;;
			*) echo "unknown command: $1"; echo_help ;;
		esac ;;
		*) echo "max number of arguments: 1" ;;
	esac
}

link_all()
{
	link $path_zshrc/.zshrc
	link $path_tmux_conf/.tmux.conf
	link $path_nvim/init.vim
}

link()
{
	file=$1

	if test -f $file; then
		echo -n "$file already exists "

		if [ -L $file ] ; then
			echo "as a symlink"
		elif [ -d $file ] ; then
			echo "as a directory, and this is unexpected. It will be ignored;"
		else
			echo "as a file"
		fi
	else
		echo "$file not found"
	fi
}

echo_help()
{
	echo "commands:"
	echo "-h --help : show this list"
	echo "-y        : auto accept all confirmations (may delete files without warning)" 
}

run $@

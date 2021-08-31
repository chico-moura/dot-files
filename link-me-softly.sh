#!/bin/bash

# soft links target path
path_zshrc=$HOME
path_tmux_conf=$HOME
path_nvim=$HOME/.config/nvim
path_coc_settings=$HOME/.config/nvim

# dot-files path
path_dot_files=$(dirname $(readlink -f $0))/files

# flags
auto_confirm=false
valid_files=true

run()
{
	check_files_existence zshrc tmux.conf init.vim

	if [ $valid_files = true ]
	then
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
	else
		echo "Check the existance and names of the files in $path_dot_files and try again"
	fi
}

check_files_existence()
{
	for file_name in "$@"
	do
		file="$path_dot_files/$file_name"
		if [ ! -f "$file" ]
		then
			echo "ERROR: $file is missing"
			valid_files=false
		fi
	done

}

link_all()
{
	link zshrc $path_zshrc/.zshrc
	link tmux.conf $path_tmux_conf/.tmux.conf
	link init.vim $path_nvim/init.vim
	link coc-settings.json $path_coc_settings/coc-settings.json
	plug_install
}

link()
{
	file=$1
	symlink=$2
	if test -f $symlink 
	then
		if [ -L "$symlink" ] 
		then
			manage_existing_link $file $symlink
		else
			manage_existing_file $file $symlink
		fi
	elif [ -d $symlink ]
	then
		echo "ERROR: $symlink is a directory, and this was unexpected. It will be ignored"
	else
		create_link $file $symlink
	fi
}

manage_existing_link()
{
	file=$1
	symlink=$2
	old_link=`readlink -f $symlink`

	if [ $old_link = $path_dot_files/$file ] 
	then
		echo "$file was already linked correctly, no action taken"
	else
		ask_for_confirmation "$file is already linked to $old_link. Replace? (y/n) "
		case $answer in
			y) rm $symlink ; create_link $file $symlink ;;
			n) echo "$file was ignored" ;;
		esac
	fi
}

manage_existing_file()
{
	file=$1
	symlink=$2

	ask_for_confirmation "$symlink exists as a file, create backup and replace original with symlink? (y/n) "
	case $answer in
		y) create_backup $symlink ; create_link $file $symlink ;;
		n) echo "$file was ignored" ;;
	esac
}

create_backup()
{
	original_file=$1

	counter=0
	while [ -f "$original_file.backup$counter" ]
	do 
		counter=$((counter+1))
	done
	
	mv $original_file $original_file.backup$counter
}

ask_for_confirmation()
{
	message=$1

	if [ $auto_confirm = true ]
	then
		answer="y"
	else
		answer="x"
	fi

	while [[ "$answer" != "y" ]] && [[ "$answer" != "n" ]]
	do
		echo -n "$message"
		read answer
	done
}

create_link()
{
	file=$1
	symlink=$2
	ln -s $path_dot_files/$file $symlink
	echo "$file symlink created: $symlink -> $path_dot_files/$file"
}

plug_install()
{
	ask_for_confirmation 'Run PlugInstall? (y/n) '
	if [ $answer = y ]
	then
		vim +'PlugInstall --sync' +qa
	fi
}

echo_help()
{
	echo "commands:"
	echo "-h --help : show this list"
	echo "-y        : auto accept all confirmations (may delete files without warning)" 
}

run $@

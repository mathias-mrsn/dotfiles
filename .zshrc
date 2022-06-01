# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# alias l="curl parrot.live"
alias 42="~/42"
alias clangf="clang -Wall -Werror -Wextra"
alias clangfs="clang -Wall -Werror -Wextra -g3 -fsanitize=address"
alias clangf++="clang++ -Wall -Werror -Wextra -std=c++98"
alias clangfs++="clang++ -Wall -Werror -Wextra -g3 -fsanitize=address -std=c++98"

function __gpush()
{
	git add .
	git status
	if [ -z $1 ]
	then
		git commit -m "SAVE"
	else
		git commit -m "$1"
	fi

	if [ -z $2 ]
	then
		git push
	else
		git push origin $2
	fi
		
}

function __get_project()
{
	if [ ! -d "~/42" ]
	then
		mkdir -p "~/42" 2> /dev/null > /dev/null
	fi 

	if [ $# -eq 2 ]
	then
	{
		if [ ! -d ~/42/copies ]
		then
			mkdir -p ~/42/copies 2> /dev/null > /dev/null
		fi

		gcl https://github.com/$2/$1.git ~/42/copies/$1_$2 2> /dev/null > /dev/null

		if [ ! $? -eq 0 ]
		then
			echo "error: repository $1 don't exist on $2's github"
		else
			echo "repository $1 fromn $2 has been cloned successfully"
		fi
		
	}
	elif [ $# -eq 1 ]
	then
	{
		if [ -d ~/42/$1 ]
		then
			cd ~/42/$1 2> /dev/null > /dev/null
		else
		{
			gcl git@github.com:mathias-mrsn/$1.git ~/42/$1 2> /dev/null > /dev/null
			if [ ! $? -eq 0 ]
			then
				echo "error: projet $1 don't exist on your's github"
			else
				echo "repository $1 from your's github has been cloned successfully"
			fi
		}
		fi
	}
	else
		echo "error: invalid number of arguments";
	fi
}
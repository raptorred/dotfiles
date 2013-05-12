# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
export PATH="/root/.gem/ruby/2.0.0/bin/:$PATH"
export EDITOR="/usr/bin/nano"
export PS1='\[\033[1;34m\][ \[\033[0m\033[1;32m\]\u\[\033[0m\] @ \[\033[1;36m\]\h\[\033[0m\033[1;34m\] ] - [ \[\033[0m\]\t\[\033[1;34m\] ] - [ \[\033[0m\]\w\[\033[1;34m\] ]\n\[\033[1;34m\][\[\033[0m\033[1;35m\]\$\[\033[0m\033[1;34m\]]>\[\033[0m\] '
alias c='clear'
alias p='sudo pacman -S'
alias pk='packer-color --noconfirm'
alias sync='sudo pacman -Sy'
alias update='sudo packer-color -Sy linux-headers && packer-color --noconfirm -Syua'
alias y='yaourt'
alias n='nano'
alias sn='sudo nano'
alias psa='ps -A'
alias psg='ps -A | grep'
alias df='df -kTh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gi='get_iplayer --nopurge'
alias rcp='rsync -P'
alias hg='history | grep -i'
alias nas='mosh nas@192.168.2.10'
# mplayer section
alias dvd='mplayer -vf pp=fb dvdnav://'

m () {
	mplayer -ao sdl "$1"
}

alias mr='find . -type f | mplayer -ao sdl -fs -playlist - -loop 0'
alias mrs='find . -type f | mplayer -ao sdl -fs -playlist - -shuffle -loop 0'
alias loctae='locate -i'
alias locate='locate -i'
alias g='google -n 14 -C'
alias restart='sudo shutdown -r now'
alias goo='sh ~/.rbenv/shims/google'

#functions

headphones () {
	mplayer -ao alsa:device=hw=1.0 $1
}

sp () {
    echo $1 | aspell -a
}

isomount () {
    sudo mount -o loop echo $1 /media/cd
}

yt () {
    m $(youtube-dl -g $1)
}

bank () {
	echo "2200 - $1" | bc
}

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ld='ls -d */'
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls# If your version of 'ls' doesn't support --group-directories-first try this:
alias lg='ls -Al | grep'   # pipe through 'grep'

# Easy extract
extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"       ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "don't know how to extract '"$1"'..." ;;
        esac
    else
        echo "'"$1"' is not a valid file!"
    fi
}

if [ -f "$HOME/.bash_ps1" ]; then
    . "$HOME/.bash_ps1"
fi

source /etc/profile.d/autojump.bash
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

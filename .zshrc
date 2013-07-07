unsetopt correct_all


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Customize to your needs...
export PATH=$HOME/.dotfiles/tools:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH:/Users/glebm/bin:/usr/local/share/npm/bin:./node_modules/.bin
# Android tools
export PATH=$PATH:$HOME/android/android-sdk/sdk/platform-tools

if [ -d "$HOME/.rbenv" ]; then
  export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Edit this file
alias zrc="vim ~/.zshrc && source ~/.zshrc"

# GIT
alias gp="git push"
alias gpu="git push -u origin/master"
alias gf="git fetch"
alias gm="git merge origin/master"
alias gco="git checkout"
alias ga="git a"
alias gs="git s" # status
alias gd="git diff"
alias gsta="git stash"
alias gstp="git stash pop"
alias gcob="git checkout -b"
alias gaa="git add --all"
alias gc="git commit"
alias gca="git commit --ammend"
alias gl="git log"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

function gccm () {
  git commit -m "$*";
}

alias iphone="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

# Projects
function proj () {
  current=~/.config/consular/current
  if [[ -n $1 ]]; then
    echo "Starting $1..."
    consular start $1
    return
  fi
  if [[ -f "$current" ]]; then
    project=`cat $current`
    echo "Starting $project..."
    consular start $project
    return
  fi
}

function setproj () {
  current=~/.config/consular/current
  if [ -f "$current" ]; then rm -f $current; fi
  echo $1 > $current
}

alias g="git"
alias ports="sudo lsof -i -P"
export EDITOR="vim"
## terminal color fun
export CLICOLOR=1
#export LSCOLORS=caFxCxDxBxegedabagacad
alias ll='ls -h1'
alias lt='ls -lTsSa'
alias lll='ls'
alias lsl="ls -lG"
alias lsla="ls -laG"
alias shortcuts="bind -P | less"

alias v="vim ."
alias m="mvim ."
alias s.="open -a 'Sublime Text 2' ."
alias s="open -a 'Sublime Text 2'"
alias duh='du -csh'
alias b="bundle"
alias bi="bundle install --binstubs --without production"
alias bu="bundle update"
alias bc="bundle check"
alias be="bundle exec"
alias bo="bundle open"

alias migrate="bundle exec rake db:migrate"
alias dpl="bundle exec cap deploy"

alias r="bundle exec rails"

alias t="TERM=screen-256color-bce tmux"
function tcwd () {
  tmux set-option default-path $PWD
}

alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias fs="bundle exec foreman start"
alias gemspeed='bundle exec ruby -e "$(curl -fsSL https://gist.github.com/raw/2588879/benchmark.rb)" | sort -n -k4'
alias i="identify"

# Handy Functions
c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c

# Z
. $HOME/.dotfiles/tools/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

function ghsearch {
  open "https://github.com/search?q=$1&type=Everything&repo=&langOverride=&start_value=1"
}
function geo {
  geocode $1 | grep L
}

# Get ActiveRecord table columns for model
function model {
  cat db/schema.rb | grep "create_table \"$1s\"" -A 1000 | \
    while read line; do
      if [ -z "$line" ]
      then
        break
      elif [[ "$line" = "end" || "$line" =~ "create_table" ]]
      then continue
      else
        echo $line
      fi
    done
}

function cdf() { cd *$1*/ } # stolen from @topfunky

# Git tab completion
# source ~/.git-completion.bash

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# Rails perf increase https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

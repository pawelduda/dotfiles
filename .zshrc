export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

if [ "$TERM" = "xterm-256color" ]; then
  xprop \
    -id $(xdotool getactivewindow) \
    -f _MOTIF_WM_HINTS 32c \
    -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/dudev/.oh-my-zsh

function manswitch() { man $1 | less -p "^ +$2"; }

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/ # Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="materialshell"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir dir_writable vcs)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time custom_progress_bar ram dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %{%F{green}%}➜ "
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

export PROGRESS_BAR_START_HOUR=10
export PROGRESS_BAR_HOURS_COUNT=8
function progress_bar()
{
  local output="%{%F{black}%}$(seq -f "%02g" $PROGRESS_BAR_START_HOUR $PROGRESS_BAR_START_HOUR) ["
  for x in $(seq 0 $PROGRESS_BAR_HOURS_COUNT)
  do
    output="$output$(if [ $(date +"%H") = $(echo $(seq -f "%02g" $(((PROGRESS_BAR_START_HOUR + $x) % 24)) $(((PROGRESS_BAR_START_HOUR + $x) % 24)))) ]; then echo '»'; else echo '_'; fi;)"
  done
  output="$output] $(seq -f "%02g" $(((PROGRESS_BAR_START_HOUR + PROGRESS_BAR_HOURS_COUNT) % 24)) $(((PROGRESS_BAR_START_HOUR + PROGRESS_BAR_HOURS_COUNT) % 24)))"
  echo $output
}
POWERLEVEL9K_CUSTOM_PROGRESS_BAR=progress_bar
POWERLEVEL9K_CUSTOM_PROGRESS_BAR_BACKGROUND="cyan"

# Reevaluate prompt expressions every time prompt is displayed
# setopt prompt_subst

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.  ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages git zsh-autosuggestions alias-tips z zsh-syntax-highlighting dotenv web-search emoji)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# eval "$(thefuck --alias)"
# eval "$(thefuck --alias kurde)"

# source ~/.bin/tmuxinator.zsh
# export TERM="xterm-256color"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# if [ "$TERM" = "xterm" ]; then
  # export TERM=xterm-256color
# fi

export RESTIC_REPOSITORY='rclone:gdrive:/'

[[ $TMUX = "" ]] && export TERM="xterm-256color"
alias fd='fdfind --hidden --no-ignore-vcs --color=always'
alias tmux="env TERM=xterm-256color tmux new-session \; split-window -h \; split-window -v"
export EDITOR="TERM=''\ nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
alias sudo='sudo '
# alias n="TERM='' nvim"
# alias rspec="bundle exec rspec"
alias rubocop="bundle exec rubocop"
alias brexit="exit"
alias be="bundle exec"
alias rake="bundle exec rake"
alias vim_diesel="TERM='' nvim"
alias vim="TERM='' nvim"
alias n="TERM='' nvim"
alias xit="exit"
alias x="exit"
# alias :q="exit"
alias fucking="sudo"
alias map="xargs -n1"
alias sso="google site:stackoverflow.com"

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# SOBO aliases alias dkc='docker-compose'
alias dm='docker-machine'
alias dkckill='docker kill $(docker ps -q)'
alias dkcr='docker-compose run --rm'
alias dkcrs='docker-compose run --rm --service-ports'

# alias notwork?='~/prettyping onet.pl'
alias cat='batcat'

alias bouncer="ssh duda@bouncer.calltracks.com"
alias paint="kolourpaint"
alias rga='/home/dudev/.asdf/installs/rust/1.35.0/bin/rga'
alias svgbob='/home/dudev/.asdf/installs/rust/1.35.0/bin/svgbob'
alias ag='rg'

export BROWSER=firefox
alias pihole-admin="$BROWSER http://192.168.0.137/admin"
alias worklog="$BROWSER https://docs.google.com/spreadsheets/d/1y3S8iqiF5PF9nVh4ODfqGyOMnUS-31FXlzl17SRzaVA/edit#gid=671000088; $BROWSER https://dashboard.selleo.com/"
alias fb="$BROWSER https://facebook.com"
alias hn="$BROWSER https://news.ycombinator.com"
alias trello="$BROWSER https://trello.com"
alias jira="$BROWSER 'https://calltracks.atlassian.net/secure/RapidBoard.jspa?rapidView=16&projectKey=OD'"
alias en-pl="$BROWSER 'https://docs.google.com/spreadsheets/d/1DuI1tdArpFMLZBXbpOlRv3L0K_0EqIBnC2HJTAgpj-M/edit#gid=0'"
alias buffer="$BROWSER 'https://www.notion.so/THE-BUFFER-bf94a5386ba1473886f77725340b4e71'"
alias f='fzf -m --ansi --preview "batcat --color=always {} | head -n 100"'
alias fzf='fzf -m --ansi'

function fzf-launch {
  while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -f|--cmd)
        local CMD="$2"
        ;;
      -t|--filetype)
        local FILETYPE="$2"
        ;;
    esac
    shift
  done

  # $CMD \
  xdg-open \
    $( \
      rg \
        ~/ \
        --files | \
          fzf \
            -m \
            # -q ".$FILETYPE\$ " \
            --cycle \
            --prompt='Open anything' \
            --history='.fzf-launch-history'
    )
}
alias '/any'='fzf-launch'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias nf='TERM="" nvim -o `fzf`'
alias gs='#gs'
alias ls='lsd'
alias gestures='sudo libinput-gestures'

# === fzf ===

if [[ ! "$PATH" == ~/.fzf/bin* ]]; then
  export PATH="$PATH:~/.fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "~/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# source "~/.fzf/shell/key-bindings.zsh"

# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
# export FZF_DEFAULT_COMMAND='rg'
export FZF_ALT_C_COMMAND='fd --type d .'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export QT_QPA_PLATFORM='wayland'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# fshow() {
#   git log --graph --color=always \
#       --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
#   fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
#       --bind 'ctrl-m:execute/
#                 echo {} | grep -o "[a-f0-9]\{7\}" |
#                 xargs -I % sh -c "git show --color=always % | less -R"
#               /'
# }

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind 'ctrl-m:execute/
                echo {} | grep -o "[a-f0-9]\{7\}" |
                xargs -I % sh -c "git show --color=always % | less -R"
              /'
}

man-find() {
    f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
}
alias configure-sway='nvim .config/sway/config'
alias configure-pihole=pihole-admin
alias vpn='expressvpn status'
# alias launch='compgen -c | sort -u | fzf --preview="which {}" | xargs -r swaymsg -t command exec'
# alias launch='history | fzf -q test --preview="which {}" | awk "{print $2}" | xargs -r swaymsg -t command exec'
alias launch='./launch'
alias q=launch
export SDL_VIDEODRIVER=wayland
alias toggle-laptop='./toggle-laptop'
alias toggle-laptop-screen-rotation='./toggle-laptop-screen-rotation'

export CONFIG_SWITCHES_PATH=~/Programming/config-switches

alias mute3='pactl set-sink-mute 3 1'
alias unmute3='pactl set-sink-mute 3 0'
alias subscribe-to-audio-events='pactl subscribe'

export GOPATH=$HOME/Programming/golang
export PATH=$PATH:$GOPATH/bin
# alias mute-all=
# alias unmute-all=
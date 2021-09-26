# Don't ask whether to import .env file every time I change dir
ZSH_DOTENV_PROMPT=false

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-kitty"
# export TERM="xterm-256color"

# if [ "$TERM" = "xterm-256color" ]; then
#   xprop \
#     -id $(xdotool getactivewindow) \
#     -f _MOTIF_WM_HINTS 32c \
#     -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
# fi

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
# plugins=(colored-man-pages git zsh-autosuggestions alias-tips z zsh-syntax-highlighting dotenv web-search emoji)
plugins=(
  colored-man-pages git zsh-autosuggestions alias-tips z fast-syntax-highlighting dotenv web-search emoji fzf-tab
  zsh-completions
)

typeset -A FAST_HIGHLIGHT
FAST_HIGHLIGHT[git-cmsg-len]=72
# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games/:/home/$USER/.cargo/bin"

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

# [[ $TMUX = "" ]] && export TERM="xterm-256color"
[[ $TMUX = "" ]] && export TERM="xterm-kitty"
alias fdfind='fdfind --hidden --no-ignore-vcs --color=always'
alias tmux="env TERM=xterm-256color tmux new-session \; split-window -h \; split-window -v"
alias ssh="TERM=xterm-256color ssh"
# export EDITOR="TERM='' nvim"
export EDITOR="nvim"
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
alias vi="TERM='' nvim"
alias n="TERM='' nvim"
alias s="spring"
alias r="rspec"
alias sr="spring rspec"
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

# alias notwork?='~/prettyping onet.pl'
alias cat='batcat'

alias paint="kolourpaint"
alias svgbob='/home/dudev/.asdf/installs/rust/1.35.0/bin/svgbob'
alias ag='rg'

export BROWSER=firefox

alias pihole-admin="$BROWSER http://192.168.0.137/admin"
alias trello="$BROWSER https://trello.com"
alias en-pl="$BROWSER 'https://docs.google.com/spreadsheets/d/1DuI1tdArpFMLZBXbpOlRv3L0K_0EqIBnC2HJTAgpj-M/edit#gid=0'"
alias buffer="$BROWSER 'https://www.notion.so/THE-BUFFER-bf94a5386ba1473886f77725340b4e71'"
alias f='fzf'
alias fzf='fzf -m --ansi --height 90% --layout=reverse --preview "batcat --color=always {} | head -n 100"'
alias apti='sudo apt install'
alias phone='adb connect 192.168.0.106:5555; scrcpy -S & disown'

function fzf-launch {
  local CMD='xdg-open'

  while [[ "$#" -gt 0 ]]
  do
    case $1 in
      -f|--cmd)
        if [ -n $2 ]; then
          CMD="$2"
        fi
        ;;
      -t|--filetype)
        local FILETYPE="$2"

        if [ $FILETYPE != "" ]; then
          local INITIAL_QUERY=".$FILETYPE\$"
        else
          local INITIAL_QUERY=""
        fi
    esac
    shift
  done

  local FILE=$( \
    rg \
      ~/ \
      --files \
      2> /dev/null | \
        fzf \
          -m \
          -q "$INITIAL_QUERY" \
          --cycle \
          --prompt="Open anything with $CMD: " \
          --history='.fzf-launch-history' \
  )

  $CMD $FILE
}
alias fl='fzf-launch'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias nf='TERM="" nvim -o `fzf`'
alias gs='#gs'
alias ls='lsd'
alias gestures='sudo libinput-gestures'
alias glog=glol

alias icat="kitty +kitten icat --clear"
alias rr=ranger
alias psql=pgcli

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
export FZF_DEFAULT_COMMAND='rg'
export FZF_ALT_C_COMMAND='fdfind --type d .'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER="qwe"
# export QT_QPA_PLATFORM='wayland'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

rga-fzf() {
  RG_PREFIX="rga --files-with-matches --rga-adapters=+pdfpages,tesseract"
  local file

  file="$(
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
      fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
      --phony -q "$1" \
      --bind "change:reload:$RG_PREFIX {q}" \
      --preview-window="70%:wrap"
  )" &&
    echo "opening $file" &&
    xdg-open "$file"
}

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
# export SDL_VIDEODRIVER=wayland
alias toggle-laptop='./toggle-laptop'
alias toggle-laptop-screen-rotation='./toggle-laptop-screen-rotation'

export CONFIG_SWITCHES_PATH=~/Programming/config-switches

alias mute3='pactl set-sink-mute 3 1'
alias unmute3='pactl set-sink-mute 3 0'
alias subscribe-to-audio-events='pactl subscribe'

_backup_prepare () {
  export $(sudo cat /home/dudev/.restic_cron_creds | xargs)
}

_backup_remove_old_snapshots () {
  restic forget -r b2:dudev-backups:backups --keep-weekly 10
}

_backup_verify () {
  restic check -r b2:dudev-backups:backups
}

backup () {
  echo "---------------Scheduled backup time---------------"
  echo ""

  _backup_prepare

  restic -r b2:dudev-backups:backups \
    --verbose \
    --exclude="$HOME/snap" \
    --exclude="$HOME/Android" \
    --exclude="$HOME/.android" \
    --exclude="$HOME/ApkProjects" \
    --exclude="$HOME/home_25-11-2019" \
    --exclude="$HOME/.asdf" \
    --exclude="$HOME/VirtualBox VMs" \
    --exclude="$HOME/.local/share/Steam" \
    --exclude="$HOME/.cache" \
    --exclude="$HOME/.npm" \
    backup ~/

  echo ""
  echo "---------------Backup done, removing old snapshots---------------"
  echo ""

  _backup_remove_old_snapshots

  echo ""
  echo "---------------Old snapshots removed, verifying the data is restorable---------------"
  echo ""

  _backup_verify

  echo ""
  echo "---------------Backup done and verified!---------------"
}

alias ga='stty sane; git add'
alias :q=exit
alias nodejs=node

export GOPATH=$HOME/Programming/golang
export PATH=$PATH:$GOPATH/bin
# alias mute-all=
# alias unmute-all=

# export MANPAGER="nvim +Man! -c ':set signcolumn='"

local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'lsd -l --color="always" $realpath'
FZF_TAB_COMMAND=(
    fzf
    --ansi   # Enable ANSI color support, necessary for showing groups
    --expect='$continuous_trigger,$print_query' # For continuous completion and print query
    '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
    --nth=2,3 --delimiter='\x00'  # Don't search prefix
    --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
    --tiebreak=begin -m --bind=tab:toggle+down,btab:up,change:top,ctrl-space:toggle --cycle
    '--query=$query'   # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
    --print-query
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

autoload -U +X bashcompinit && bashcompinit

# Created by `pipx` on 2021-08-31 09:52:32
export PATH="$PATH:/home/dudev/.local/bin"

android_studio () {
  /home/dudev/android-studio/jre/bin/java -classpath /home/dudev/android-studio/lib/bootstrap.jar:/home/dudev/android-studio/lib/util.jar:/home/dudev/android-studio/lib/jdom.jar:/home/dudev/android-studio/lib/log4j.jar:/home/dudev/android-studio/lib/jna.jar:/home/dudev/android-studio/jre/lib/tools.jar -Xms256m -Xmx1280m -XX:ReservedCodeCacheSize=512m -XX:MaxJavaStackTraceDepth=10000 -XX:+HeapDumpOnOutOfMemoryError -XX:-OmitStackTraceInFastThrow -ea -XX:+UseG1GC -XX:SoftRefLRUPolicyMSPerMB=50 -XX:CICompilerCount=2 -Dsun.io.useCanonCaches=false -Djdk.http.auth.tunneling.disabledSchemes="" -Djdk.attach.allowAttachSelf=true -Djdk.module.illegalAccess.silent=true -Dkotlinx.coroutines.debug=off -Djna.nosys=true -Djna.boot.library.path= -Didea.vendor.name=Google -Dsun.tools.attach.tmp.only=true -XX:ErrorFile=/home/dudev/java_error_in_studio_%p.log -XX:HeapDumpPath=/home/dudev/java_error_in_studio_.hprof -Didea.vendor.name=Google -Didea.paths.selector=AndroidStudioPreview2021.1 -Djb.vmOptionsFile=/home/dudev/android-studio/bin/studio64.vmoptions -Didea.platform.prefix=AndroidStudio -Didea.jre.check=true com.intellij.idea.Main
}

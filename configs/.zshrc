# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directory where zinit and it's plugins go
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if doesn't exist.
if [ ! -d $ZINIT_HOME ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# To be able to cd after using yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in PowerLevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Keybinding
bindkey -e
# Get history of already completed commany
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# ctrl+arrow key to move through words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Aliases
alias cd='z'
alias open='xdg-open'
# alias ls='ls --color'
alias ls='eza'
alias ll='ls -l'
alias lt='ls -lT'
alias fastfetch="fastfetch --logo windows"
alias viu="viu-media" # fastanime new name for some reason
alias ff="fastfetch"
alias neofetch="ff"
alias dojava="javac *.java && java"
alias bonsai="cbonsai -li"
alias vim=nvim
alias vi=nvim
alias timeshift-launcher="sudo -E timeshift-launcher"
alias py=python
alias temperature="busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q"

# Tmux stuff
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'

# SSH Servers
alias sth="ssh jjxc1@jjxc1.teaching.cs.st-andrews.ac.uk"
alias sshome="ssh jack@jasvk.duckdns.org -p 26"
alias sshomel="ssh jack@192.168.1.184"

# Environment variables
export TERM=xterm-256color
export RUSTC_WRAPPER=/usr/bin/sccache
export MAKEFLAGS="--jobs=$(nproc)" # For multi-threading make compilation. (Will multi-thread some aur package builds)
export MANPAGER='nvim +Man!'

# Shell integrations
eval "$(fzf --zsh)"
if [ -f "/usr/bin/mise" ]; then
	eval "$(/usr/bin/mise activate zsh)"
fi
eval "$(zoxide init zsh)"

# Load completions
autoload -U compinit && compinit

# Start uwsm
if [ command -v uwsm > /dev/null ]; then
	if uwsm check may-start && uwsm select; then
		exec systemd-cat -t uwsm_start uwsm start default
	fi
fi

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [ -f ~/.env ]; then
    source ~/.env
fi
eval "$(starship init zsh)"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='nvim'
# Created by `pipx` on 2024-04-02 18:55:20
export GIT_EDITOR=nvim
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH="$PATH:/Users/prezakhani/.local/bin"
export LC_ALL=en_US.UTF-8

export DISABLE_AUTO_TITLE=true
# export GITHUB_TOKEN=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
# make gpg work in mac
export GPG_TTY=$(tty)
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# zinit ice depth=1; zinit light romkatv/powerlevel10k
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippits

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

#loca completion
autoload -Uz compinit && compinit

zinit cdreplay -q 



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Key bindigns
# bind key to nvim
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#
# History
HISTZIZE=500000
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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color=auto'
alias nvim='nvim'
alias c='clear'


# Shell integeration

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(gh copilot alias -- zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/prezakhani/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/prezakhani/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/prezakhani/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/prezakhani/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source "$HOME/.rye/env"


# yg command: copies content from ../NeMo-Guardrails/docs to ./docs
yg() {
  cp -r ../NeMo-Guardrails/docs/* ./docs/
  echo "Copied content from ../NeMo-Guardrails/docs to ./docs"
}

# pg command: copies content from ./docs to ../NeMo-Guardrails/docs
pg() {
  cp -r ./docs/* ../NeMo-Guardrails/docs/
  echo "Copied content from ./docs to ../NeMo-Guardrails/docs"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath+=${ZDOTDIR:-~}/.zsh_functions


[[ ! -f ~/.p10k.zsh ]] || source $HOME/.p10k.zsh
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
source $HOME/zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

setopt interactivecomments
source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.oh-my-zsh/lib/history.zsh

# Custom operations
source $HOME/.cstom_operations

# ssh key adddition
if [[ ! -f /tmp/ssh_added_today ]]; then
  export SSH_ASKPASS="$HOME/askpass.sh"
  setsid ssh-add $HOME/.ssh/id_rsa < /dev/null
  touch /tmp/ssh_added_today
# Clear terminal after 0.5 second
  sleep 0.5 && clear
fi

source $HOME/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

print_centered_message "Welcome back sschauhan!"

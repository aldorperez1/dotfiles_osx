 #           _     _       _                                
 #     /\   | |   | |     ( )                               
 #    /  \  | | __| | ___ |/ ___                            
 #   / /\ \ | |/ _` |/ _ \  / __|                           
 #  / ____ \| | (_| | (_) | \__ \                           
 # /_/_   \_\_|\__,_|\___/  |___/   _ _                     
 #   | |             | |           | (_)                    
 #   | |__   __ _ ___| |__     __ _| |_  __ _ ___  ___  ___ 
 #   | '_ \ / _` / __| '_ \   / _` | | |/ _` / __|/ _ \/ __|
 #  _| |_) | (_| \__ \ | | | | (_| | | | (_| \__ \  __/\__ \
 # (_)_.__/ \__,_|___/_| |_|  \__,_|_|_|\__,_|___/\___||___/

################################################################################
# aliases cant be transfered between sessions and therefore must be made every
# time a shell starts.
################################################################################                                                        


printf "\033[32m * Executing Bash Aliases\033[0m\n"


##-------------------------------------------------------------------------------
# General Aliases : This should work anywhere
#-------------------------------------------------------------------------------
alias bashrc="vim ~/.bashrc"
alias rebash="source ~/.bashrc"
alias reprofile="source ~/.profile"
alias profile="vim ~/.profile"

alias ls='ls -F'
alias ll='ls -lAhFG'
alias la='ls -lahF'
alias ldir='ls -l | grep -e "^d"'  # list only directories

# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"

# Copy current working directory
alias cbwd="pwd | pbcopy"
  # Copy most recent command in bash history (ot working currently)
  #alias cbhs="history | tail -n 2  | head -n 1| awk '{$1=""; print $0}'| pbcopy"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."
alias sd="sudo shutdown -fh now"

#-------------------------------------------------------------------------------
# Docker aliases : 
#-------------------------------------------------------------------------------
if command -v docker &>/dev/null; then
  alias dls='docker ps'
  alias dlsa='docker ps -a'
  alias dkr='docker'
fi


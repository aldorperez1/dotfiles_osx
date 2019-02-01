 #           _     _       _       
 #     /\   | |   | |     ( )      
 #    /  \  | | __| | ___ |/ ___   
 #   / /\ \ | |/ _` |/ _ \  / __|  
 #  / ____ \| | (_| | (_) | \__ \  
 # /_/    \_\_|\__,_|\___/_ |___/  
 #                    / _(_) |     
 #    _ __  _ __ ___ | |_ _| | ___ 
 #   | '_ \| '__/ _ \|  _| | |/ _ \
 #  _| |_) | | | (_) | | | | |  __/
 # (_) .__/|_|  \___/|_| |_|_|\___|
 #   | |                           
 #   |_|   


################################################################################
#|#                         INSTRUCTIONS
# This is always executed for login shell (username and password).
# 
# DIRECTIONS: 
#   1. Put things here like environmental variables that pertain to all shells
#   2. Put things that only pertain to bash in bashrc like functions and aliases
################################################################################



########################################################
#|# PREAMBLE: Getting to know what environment we are in #
######################################################## 
printf "\033[33m * Executing Bash_Profile\n\033[0m"
export dotfiles_path="${HOME}/src/dotfiles"


################################################################################
#| Increase History
################################################################################
export HISTFILESIZE=10000
export HISTSIZE=10000



########################################################
#|## Bash-Completion                                 #
########################################################

# Add tab completion for bash completion 2ource all the bash_completions
if command -v brew > /dev/null && [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    source $(brew --prefix)/share/bash-completion/bash_completion
fi

# Kubectl
if command -v kubectl > /dev/null; then
    source <(kubectl completion bash)
fi
########################################################
#|## PATH STUFF                                        #
########################################################

### pathprepend:Appends paths to the front of the PATH variable if they are not
###             already there
function pathprepend() {
  for ((i=$#; i>0; i--)); 
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}
export -f pathprepend

### pathappend: Appends paths to the back of the PATH variable if they are not
###             already there
function pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}
export -f pathappend



########################################################
#|#  File Permission                                   #
########################################################  

### executify: Gives execution priviledge to the given file
###
function executify(){
    file=${1}
    if  [ -f ${file} -a ! -x ${file} ]; then
      chmod  755 ${file}
    fi
}
export -f executify


########################################################
#|#  Git: Functions                                 #
########################################################  

### parse_git_branch: Figures out what branch you are in and prints it. Used
#                     in PS1.
function parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
export -f parse_git_branch

## Colors for text
red='\[\033[31m\]'
green='\[\033[32m\]'
yellow='\[\033[33m\]'
blue='\[\033[34m\]'
magenta='\[\033[35m\]'
cyan='\[\033[36m\]'
light_gray='\[\033[37m\]'
c_default='\[\033[39m\]'
white='\[\033[97m\]'
norm='\[\033[0m\]'
orange='\[\033[38;5;166m\]'
purple='\[\033[38;5;99m\]'

#-------------------------------------------------------------------------------
# Prompt : 
#-------------------------------------------------------------------------------

export PS1="$purple[\t] $cyan\u$white@$green\h:$yellow\w${red}\$(parse_git_branch)\n$orange\$$norm "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
  


################################################################################
#| # Other Cool Functions #
################################################################################

function cbf() { cat "$1" | pbcopy; }
export -f cbf

function get_path() {
  echo $PATH | tr ':' '\n'
}
export -f get_path
################################################################################
#| # Default Editor #
################################################################################
export EDITOR=vim

#-------------------------------------------------------------------------------
# Path : Desc.
#-------------------------------------------------------------------------------
# Adding my paths to the front of path
pathprepend ${HOME}/.local/bin ${HOME}/.scripts "/usr/local/bin:$PATH" "/usr/local/sbin:$PATH"
export PATH

#-------------------------------------------------------------------------------
# iTerm : Desc.
#-------------------------------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

################################################################################
#|#  Bashrc:  Executing bashrc for the first shell
################################################################################
if [ -f ~/.bashrc ]; then
    printf "\033[32m - Executing bashrc from within bash_profile \033[0m \n"
    . ~/.bashrc
fi

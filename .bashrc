export TERM=cygwin
export CTEST_OUTPUT_ON_FAILURE=1

eval "$(dircolors -b ${HOME}/DIR_COLORS)"
set -o vi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# When changing directory small typos can be ignored by bash
shopt -s cdspell

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
        source "${HOME}/.bash_aliases"
fi

if [ -f "${HOME}/.bash_prompt" ]; then
        source "${HOME}/.bash_prompt"
fi

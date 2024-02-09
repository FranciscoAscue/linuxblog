
Install anaconda in linux, bash and zsh 
----------------------------------------

```bash

sudo chmod 777 Anaconda3-2022.05-Linux-x86_64.sh
./Anaconda3-2022.05-Linux-x86_64.sh

```

If you using zsh themes of oh-my-zsh, may be the prompt is no set correctly.
Search theme of .oh-my-zsh/themes 
add the following lines to solving the problem

```bash
 function conda_info {
      if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
         echo "%{$fg[green]%}‹${CONDA_DEFAULT_ENV}›%{$reset_color%}"
      fi
 }


local conda='$(conda_info)'

PROMPT="... ${conda} ... "

```

```zsh
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/username/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/username/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/username/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/username/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

```
Final version as example zsh-theme fino.

```zsh-theme
# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function prompt_char {
  command git branch &>/dev/null && echo "±" || echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

 function conda_info {
      if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
         echo "%{$fg[green]%} ‹${CONDA_DEFAULT_ENV}›%{$reset_color%}"
      fi
 }


local conda='$(conda_info)'
local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='$(prompt_char)'

PROMPT="╭─${FG[050]}%n ${FG[239]}at ${FG[033]}$(box_name) ${FG[239]}in %B${FG[226]}%c%b${git_info}${ruby_env}${virtualenv_info}${conda}
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[239]}on%{$reset_color%} ${FG[255]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[202]}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[040]}✔"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${FG[239]}using${FG[243]} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[239]}using${FG[243]} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"
```

### half-life theme

```zsh
setopt prompt_subst
PROMPT="${FG[060]}% ‹\${CONDA_DEFAULT_ENV}› ${FG[050]}%n%{$reset_color%} in ${limegreen}%c%{$reset_color%}\$(virtualenv_prompt_info)\$(ruby_prompt_info)\$vcs_info_msg_0_${orange} λ%{$reset_color%} "
```


If that not solving the problem probe with the following


```bash
conda config --set env_prompt ''
conda deactivate
conda activate base
```

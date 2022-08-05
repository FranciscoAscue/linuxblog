
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

If that not solving the problem probe with the following


```bash
conda config --set env_prompt ''
conda deactivate
conda activate base
```

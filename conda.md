
Install anaconda in linux, bash and zsh 
----------------------------------------

```bash

sudo chmod 777 Anaconda3-2022.05-Linux-x86_64.sh
./Anaconda3-2022.05-Linux-x86_64.sh

```

If you using zsh themes of oh-my-zsh, may be the prompt is no set correctly.
Search theme of .oh-my-zsh/themes 
add the following lines to solving the problem

```json
 function conda_info {
      if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
         echo "%{$fg[green]%}‹${CONDA_DEFAULT_ENV}›%{$reset_color%}"
      fi
 }


local conda='$(conda_info)'

PROMPT="... ${conda} ... "

```

If that not solving the problem probe with the following


```bash
conda config --set env_prompt ''
conda deactivate
conda activate base
```

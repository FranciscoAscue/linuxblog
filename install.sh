wget https://repo.anaconda.com/archive/Anaconda3-2023.07-1-Linux-x86_64.sh
subo bash Anaconda3-2023.07-1-Linux-x86_64.sh

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install nextstrain-cli \
  -c conda-forge -c bioconda \
  --strict-channel-priority \
  --override-channels

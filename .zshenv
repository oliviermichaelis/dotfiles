###############################################################################
# ZSH
###############################################################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# pip/python user home directory for scripts:
export USER_BASE_PATH=$(python -m site --user-base)

export PATH=$PATH:$USER_BASE_PATH/bin
export GOPATH=$HOME/go

# Iterates over custom cluster config directory and appends each file to env
# This is used e.g. by kubectl, kubectx etc
for filepath in ~/.kube/configs/*; do
  KUBECONFIG=$KUBECONFIG:$filepath
done
export KUBECONFIG

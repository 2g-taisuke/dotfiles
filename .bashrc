# alias
if [[ -f $HOME/.aliases ]]; then
  . $HOME/.aliases
fi

# function
if [[ -d "${HOME}/.functions" ]]; then
  for f in $(\ls "${HOME}/.functions"); do
    . "${HOME}/.functions/${f}"
    [[ -r "${file}" ]] && source "${file}"
  done
fi

# other
if [[ -d "${HOME}/.bashrc.d" ]]; then
  for f in $(\ls "${HOME}/.bashrc.d"); do
    . "${HOME}/.bashrc.d/${f}"
  done
fi

#!/usr/bin/env bash
# link.sh : dotfilesをリンクさせる
# -----------------------------------------------------------------------------
DOT_DIR="${HOME}/dotfiles"

main() {
  local f

  cd "${DOT_DIR}"
  echo "link dotfile"

  for f in .??*; do

    # 除外ファイル
    [[ "${f}" == ".git" ]] && continue

    if ln -sf "${DOT_DIR}/${f}" "${HOME}/${f}"; then
      echo "link ${DOT_DIR}/${f} to ${HOME}/${f}"
    fi
  done


  # utilsもリンク貼る
  if ln -sf "${HOME}/bin/utils" "${HOME}/.functions"; then
    echo "link ${HOME}/bin/utils to ${HOME}/.functions"
  fi

  # ~/.config/peco
  ln -sf "${DOT_DIR}/peco" "${HOME}/.config/peco"
}

main "${@}"

#!/usr/bin/env bash
# link.sh : dotfilesをリンクさせる
# -----------------------------------------------------------------------------
DOT_DIR="${HOME}/.dotfiles"

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


  # ~/bin/utils
  if ln -sf "${HOME}/bin/utils" "${HOME}/.functions"; then
    echo "link ${HOME}/bin/utils to ${HOME}/.functions"
  fi

  # ~/.config/peco
  # 既に存在するディレクトリにシンボリックリンクを張ると、そのディレクトリの中に
  # 作ると見做されるらしく、リンク元のディレクトリの中に再帰的に作られてしまう。
  # 応急処置だが一度削除して回避。
  rm "${HOME}/.config/peco" > /dev/null 2>&1
  if ln -sf "${DOT_DIR}/peco" "${HOME}/.config/peco"; then
    echo "link ${DOT_DIR}/peco to ${HOME}/.config/peco"
  fi

  # ~/.config/karabiner
  if ln -sf "${DOT_DIR}/karabiner.json" \
            "${HOME}/.config/karabiner/karabiner.json"; then
    echo "link ${DOT_DIR}/karabiner.json to ${HOME}/.config/karabiner/karabiner.json"
 fi
}

main "${@}"

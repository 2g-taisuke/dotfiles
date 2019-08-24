#!/usr/bin/env bash
# link.sh : dotfilesをリンクさせる
# -----------------------------------------------------------------------------
DOT_DIR="${HOME}/.dotfiles"

main() {
  local f
  local excluded_file

  cd "${DOT_DIR}"
  echo "link dotfile"

  for f in .??*; do

    # 除外ファイル
    for excluded_file in .git .idea; do
      [[ "${f}" == "${excluded_file}" ]] && continue 2
    done

    if ln -sf "${DOT_DIR}/${f}" "${HOME}"; then
      echo "link ${DOT_DIR}/${f} to ${HOME}/${f}"
    fi
  done
}

main "${@}"

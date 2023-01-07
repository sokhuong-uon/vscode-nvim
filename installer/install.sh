#!/usr/bin/env bash
set -eo pipefail

NVIM_PATH="$(which nvim)"

# Set branch to main unless specified by the user
declare -x VN_BRANCH="${VN_BRANCH:-"main"}"
declare -xr VN_REMOTE="${VN_REMOTE:-sokhuong-uon/vscode-nvim.git}"
declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -xr VSN_BASE_DIR="${VSN_BASE_DIR:-"$HOME/.config/vscode-nvim"}"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

function main() {
  check_system_deps
  clone_vscode_nvim

  echo ""
  print_art
  echo ""

  echo -e "${YELLOW}DO NOT FORGET to add content in settings.json:${ENDCOLOR} https://raw.githubusercontent.com/sokhuong-uon/vscode-nvim/main/whichkey/settings.json ${YELLOW}in your vscode setting${ENDCOLOR}"
  echo ""

  echo -e "**Replace:${RED} \"vscode-neovim.neovimExecutablePaths.linux\": \"/path/to/your/nvim\"${ENDCOLOR}"
  echo -e "By:${GREEN} \"vscode-neovim.neovimExecutablePaths.linux\": \"$NVIM_PATH\""
  echo ""
  echo -e "Additionaly, you should add some part of keybindigs.json: https://raw.githubusercontent.com/sokhuong-uon/vscode-nvim/main/keybindings.json in your vscode keybindings.json"
}

function check_system_deps() {

  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
}

function clone_vscode_nvim() {
  echo "Cloning vscode-nvim"
  if ! git clone --branch "$VN_BRANCH" \
    "https://github.com/${VN_REMOTE}" "$VSN_BASE_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

function print_art() {
  cat <<'EOF'
  ...   ...   ...
   ... ..... ... 
    ..... .....  
     ...   ...   
      .     .    Thank you for installing vscode-nvim!
EOF
}

main "$@"

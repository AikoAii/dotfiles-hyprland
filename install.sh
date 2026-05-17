#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES_DIR

source "${DOTFILES_DIR}/scripts/utils/lib.sh"

trap 'error "Installation failed in ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]}: ${BASH_COMMAND}"' ERR

step "Hyprland Dotfiles Installer"
info "Source: ${DOTFILES_DIR}"

# Source and run modular installer steps
source "${DOTFILES_DIR}/scripts/install/checks.sh"
source "${DOTFILES_DIR}/scripts/install/detect-distro.sh"
source "${DOTFILES_DIR}/scripts/install/dependencies.sh"
source "${DOTFILES_DIR}/scripts/install/backup.sh"
source "${DOTFILES_DIR}/scripts/install/symlink.sh"
source "${DOTFILES_DIR}/scripts/install/fonts.sh"
source "${DOTFILES_DIR}/scripts/install/services.sh"
source "${DOTFILES_DIR}/scripts/install/permissions.sh"
source "${DOTFILES_DIR}/scripts/install/finalize.sh"

run_checks
detect_distro
install_dependencies
backup_existing_configs
create_symlinks
install_fonts
setup_services
set_permissions
finalize_install

echo ""
ok "Installation complete. Log out and start Hyprland."

#!/usr/bin/env bash

install_dependencies() {
  info "Installing dependencies..."

  # --- Arch-based distros ---
  if [[ "$OS_ID" == "arch" || "$OS_LIKE" == *"arch"* ]]; then

    local HELPER=""

    # --- Package files ---
    local official_file=""

    if [[ "$OS_ID" == "artix" ]]; then
      official_file="${DOTFILES_DIR}/packages/artix.txt"
    else
      official_file="${DOTFILES_DIR}/packages/arch-official.txt"
    fi
    local aur_file="${DOTFILES_DIR}/packages/arch-aur.txt"

    [[ -f "$official_file" ]] ||
      error "Missing package list: ${official_file}"

    # --- Install official packages ---
    mapfile -t packages < <(
      grep -vE '^\s*#|^\s*$' "$official_file"
    )

    if [[ ${#packages[@]} -eq 0 ]]; then
      error "No packages found in ${official_file}"
    fi

    info "Installing official Arch packages..."

    sudo pacman -S --needed --noconfirm "${packages[@]}" ||
      error "Failed to install official Arch packages"

    # --- Install AUR packages ---
    if [[ -f "$aur_file" ]]; then

      mapfile -t aur_packages < <(
        grep -vE '^\s*#|^\s*$' "$aur_file"
      )

      if [[ ${#aur_packages[@]} -gt 0 ]]; then

        if command -v yay >/dev/null 2>&1; then
          HELPER="yay"

        elif command -v paru >/dev/null 2>&1; then
          HELPER="paru"

        else
          warn "No AUR helper detected. Skipping AUR packages."
        fi

        info "Installing AUR packages using ${HELPER}..."

        $HELPER -S --needed --noconfirm "${aur_packages[@]}" ||
          warn "Failed to install some AUR packages"
      fi
    fi

  # --- Fedora-based distros ---
  elif [[ "$OS_ID" == "fedora" || "$OS_LIKE" == *"fedora"* ]]; then

    local packages_file="${DOTFILES_DIR}/packages/fedora.txt"

    [[ -f "$packages_file" ]] || error "Missing package list: ${packages_file}"

    mapfile -t packages < <(
      grep -vE '^\s*#|^\s*$' "$packages_file"
    )

    if [[ ${#packages[@]} -eq 0 ]]; then
      error "No packages found in ${packages_file}"
    fi

    info "Using package manager: dnf"

    sudo dnf install -y "${packages[@]}" ||
      error "Failed to install Fedora dependencies"

  else
    warn "Unsupported OS for automatic dependency installation."
    warn "Please install dependencies manually."
    return
  fi

  ok "Dependencies installed successfully."
}

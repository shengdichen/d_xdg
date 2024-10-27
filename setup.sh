#!/usr/bin/env dash

SCRIPT_PATH="$(realpath "$(dirname "${0}")")"
cd "${SCRIPT_PATH}" || exit 3

__spawn_xyz() {
    local _xdg="${HOME}/xyz" _label_local="a"

    mkdir -p "${_xdg}/Dox/${_label_local}"

    mkdir -p "${_xdg}/MDA/Aud/${_label_local}"
    mkdir -p "${_xdg}/MDA/Vid/${_label_local}"
    mkdir -p "${_xdg}/MDA/Lit/${_label_local}"
    mkdir -p "${_xdg}/MDA/Pic/${_label_local}"

    mkdir -p "${_xdg}/misc/Desktop"
    mkdir -p "${_xdg}/misc/Downloads"
    mkdir -p "${_xdg}/misc/Public"
    mkdir -p "${_xdg}/misc/Templates"
}

__spawn_local() {
    local _local="${HOME}/.local"
    mkdir -p "${_local}/bin"
    mkdir -p "${_local}/lib"
    mkdir -p "${_local}/script"
    mkdir -p "${_local}/share/applications"
    mkdir -p "${_local}/state"
}

__stow() {
    (
        cd "../" && stow -R \
            --target="${HOME}/" \
            --ignore="\.git.*" \
            --ignore="setup.sh" \
            "$(basename "${SCRIPT_PATH}")"
    )
}

__spawn_xyz
__spawn_local
__stow

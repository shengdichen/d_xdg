#!/usr/bin/env dash

SCRIPT_PATH="$(realpath "$(dirname "${0}")")"
cd "${SCRIPT_PATH}" || exit 3

_spawn() {
    local xdg="${HOME}/xyz" alias_local="a"
    mkdir -p "${xdg}"
    (
        cd "${xdg}" || exit 3

        mkdir -p "./Dox/${alias_local}"

        mkdir -p "./MDA/Aud/${alias_local}"
        mkdir -p "./MDA/Vid/${alias_local}"
        mkdir -p "./MDA/Lit/${alias_local}"
        mkdir -p "./MDA/Pic/${alias_local}"

        mkdir -p "./misc/Desktop/"
        mkdir -p "./misc/Downloads/"
        mkdir -p "./misc/Public/"
        mkdir -p "./misc/Templates/"
    )

    local _local="${HOME}/.local"
    mkdir -p "${_local}/bin/"
    mkdir -p "${_local}/lib/"
    mkdir -p "${_local}/script/"
    mkdir -p "${_local}/share/applications"
    mkdir -p "${_local}/state/"
}

_stow() {
    (
        cd "../" && stow -R \
            --target="${HOME}/" \
            --ignore="\.git.*" \
            --ignore="setup.sh" \
            "$(basename "${SCRIPT_PATH}")"
    )
}

_spawn
_stow
unset SCRIPT_PATH
unset -f _spawn _stow

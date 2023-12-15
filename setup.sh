_spawn() {
    local xdg="${HOME}/xdg" alias_local="a"
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
}

_stow() {
    local pdir="${PWD##*/}"
    (
        cd "../" || exit 3
        stow -R \
            --target="${HOME}/" \
            --ignore="\.git.*" \
            --ignore="setup.sh" \
            "${pdir}"
    )
}

_spawn
_stow
unset -f _spawn _stow

_spawn() {
    local xdg="${HOME}/xdg"
    mkdir -p "${xdg}"
    (
        cd "${xdg}" || exit 3

        mkdir -p "Dox/a"

        mkdir -p "MDA/Aud/a"
        mkdir -p "MDA/Vid/a"
        mkdir -p "MDA/Lit/a"
        mkdir -p "MDA/Pic/a"

        mkdir -p "misc/Desktop/"
        mkdir -p "misc/Downloads/"
        mkdir -p "misc/Public/"
        mkdir -p "misc/Templates/"
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

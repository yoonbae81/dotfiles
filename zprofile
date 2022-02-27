export EDITOR="vim"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
  export MOZ_ENABLE_WAYLAND=1
  exec sway
fi

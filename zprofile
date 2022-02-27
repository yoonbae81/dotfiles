export EDITOR="vim"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
  exec sway
fi

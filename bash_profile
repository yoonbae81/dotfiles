#
# ~/.bash_profile
#
export EDITOR="nvim"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
  export MOZ_ENABLE_WAYLAND=1
  exec sway
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

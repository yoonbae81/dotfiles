#
# ~/.bash_profile
#
export EDITOR="nvim"
export GTK_IM_MODULE=kime
export QT_IM_MODULE=kime
export XMODIFIERS=@im=kime

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
  export MOZ_ENABLE_WAYLAND=1
  exec sway
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

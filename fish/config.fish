export EDITOR="nvim"

if status is-login
	export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
	export MOZ_ENABLE_WAYLAND=1
	exec sway
end

if status is-interactive
end

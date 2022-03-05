
## Backlight

Install a package
```
# sudo pacman -S brightnessctl
```

Configure Sway
```
bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
bindsym XF86MonBrightnessUp exec brightnessctl set +5%
```

### References
- https://github.com/kelp/arch-matebook-x-pro

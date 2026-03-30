#!/bin/sh

# window action key
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'

# mouse & touchpad
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

# disable animations
gsettings set org.gnome.desktop.interface enable-animations false

# window focus mode (focus windows by hovering)
gsettings set org.gnome.desktop.wm.preferences focus-mode "sloppy"

# titlebar actions
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.desktop.wm.preferences action-right-click-titlebar 'menu'

# titlebar buttons
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

# alt+tab: ignore application groups, switch by each window
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.shell.window-switcher current-workspace-only true

# new window is forced to be centred
gsettings set org.gnome.mutter center-new-windows true

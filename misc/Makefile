day-brighter:
	xrandr --output HDMI-1 --brightness 0.8
day-bright:
	xrandr --output HDMI-1 --brightness 0.7
day-dark:
	xrandr --output HDMI-1 --brightness 0.66
night-bright:
	xrandr --output HDMI-1 --brightness 0.6
night-dark:
	xrandr --output HDMI-1 --brightness 0.5
night-darker:
	xrandr --output HDMI-1 --brightness 0.42
lscreen-off:
	xrandr --output eDP-1 --off
lscreen-on:
	xrandr --output eDP-1 --auto
display-external-only:
	xrandr --output eDP-1 --off --output HDMI-1 --auto --primary
display-laptop-only:
	xrandr --output eDP-1 --auto --primary --output HDMI-1 --off
display-clone:
	xrandr --output eDP-1 --auto --output HDMI-1 --auto --same-as eDP-1
display-dual:
	xrandr --output eDP-1 --auto --output HDMI-1 --auto --right-of eDP-1 --primary
keyboard-dvorak-dual:
	setxkbmap -layout us,us -variant ,dvorak -option "lv3:rwin_switch,grp:alt_space_toggle"
keyboard-colemak-dual:
	setxkbmap -layout us,us -variant ,colemak -option "lv3:rwin_switch,grp:alt_space_toggle"
# xrandr --output LVDS-1 --off --output e-DP-1 --off --output HDMI-1 --primary --mode 1280x1024 --pos 0x0 --rotate normal --output VGA-1 --off
ssh-dyte-vm:
	ssh -i ~/.ssh/dyte_vm/LightsailDefaultKey-ap-southeast-1.pem ubuntu@13.233.112.41
ssh-dyte-jumphost:
	ssh -i ~/.ssh/dyte_staging_jumphost/dyte.pem ubuntu@jumphost.staging.dyte.in
ssh-mc-server:
	ssh -i ~/.ssh/mc/mc_key_1212.pem priyeshbhawsar15@20.205.124.233
remove-title-bar:
	xprop -format _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS 2

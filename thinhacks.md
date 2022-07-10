# terminal
update 

`sudo update-alternatives --config x-terminal-emulator`

makes a symlink

/usr/bin/x-terminal-emulator -> /etc/alternatives/x-terminal-emulator

so we manually link 

 /etc/alternatives/x-terminal-emulator -> whatever we wanti

in our case, so it's not conflicting with aterm:
~/.local/bin/aaterm

which is eg 
aterm -tr -tint blue -fade 50 -fg white -bg blue +sb &

# backlight
## system level changes
 
 sudo vi /etc/udev/rules.d/backlight.rules

 ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<vendor>", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<vendor>", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"



replace vendor with 'mba6x_bl' 
and add yourself to videogroup

usermod -aG video <user>

## keyboard backlight
sudo brightnessctl -d smc::kbd_backlight s 0%
sudo vi /etc/udev/rules.d/keybbacklight.rules
 
SUBSYSTEM=="leds", ACTION=="add", RUN+="/bin/chgrp -R leds /sys%p", RUN+="/bin/chmod -R g=u /sys%p"
SUBSYSTEM=="leds", ACTION=="change", ENV{TRIGGER}!="none", RUN+="/bin/chgrp -R leds /sys%p", RUN+="/bin/chmod -R g=u /sys%p"


## volume keys


sudo apt install volumeicon-alsa

    Open the tint2 config file:

    sudo [text-editor] $HOME/.config/tint2/tint2rc

    Re-arrange the panel items display and order in the "#panel" section.
    For ex."panel_items = TSECB"

    add a new config section for audio as E-'executor':

    # Executor 1  
    execp = new  
    execp_command = volumeicon  
    execp_interval = 0  
    execp_has_icon = 1  
    execp_cache_icon = 0  
    execp_continuous = 0  

start tint2conf GUI, and go to "panel items" and add the "Executor" that has been created and apply changes.

right-click the volume-icon and bind the Volume keys in the config...


## openbox config bindings
look for keyeventnames using xev
/home/kaos/.config/openbox/rc.xml


    <!-- Keybindings for brightness -->
    <keybind key="XF86MonBrightnessDown">
      <action name="Execute">
        <command>brightnessctl set 10-
        </command>
      </action>
    </keybind>
    <keybind key="XF86MonBrightnessUp">
      <action name="Execute">
        <command>brightnessctl set 10+
        </command>
      </action>
    </keybind>
    <keybind key="XF86KbdBrightnessDown">
      <action name="Execute">
        <command>brightnessctl -d smc::kbd_backlight set 10-
        </command>
      </action>
    </keybind>
    <keybind key="XF86KbdBrightnessUp">
      <action name="Execute">
        <command>brightnessctl -d smc::kbd_backlight set 10+
        </command>
      </action>
    </keybind>



  # artwiz font
  moving out 
  sudo mv  /etc/fonts/conf.d/70-no-bitmaps.conf ~/
https://github.com/whitelynx/artwiz-fonts-wl

copy font to ~/.fonts/



# sleep
cat /proc/acpi/wakeup

Check to see that XHC1 and LID0 are enabled. If they are, disabling them will fix the problem. After disabling them, the only way to wake up your computer from suspend is by using the power button.

To disable these settings, create the following service that runs on startup:

sudo vim /etc/systemd/system/suspend-fix.service

Then add the following text and save:
```
[Unit]
Description=Fix for the suspend issue
[Service]
Type=oneshot 
ExecStart=/bin/sh -c "echo XHC1 > /proc/acpi/wakeup && echo LID0 > /proc/acpi/wakeup"
[Install]
WantedBy=multi-user.target
```
And then run the following:

```
systemctl enable suspend-fix.service
systemctl start suspend-fix.service
```
Disabling only XHC1 is not recommended if you have this bug, since it may result in glitchy behavior. 




# bash hacking
## .bashrc

## ~/.dircolors
DIR 01;33
# vim
## ~/.vimrc
colorscheme murphy




## kezboard setup
# clear all options
setxkbmap -model "pc105" -layout "us" -option ""  
<!-- 
setxkbmap -rules "evdev" -model "pc105" -layout "us" -option "terminate:ctrl_alt_bksp,lv3:rwin_switch,grp:shifts_toggle,caps:ctrl_modifier,altwin:swap_lalt_lwin" -->


xmodmap -e "keycode  94 = grave asciitilde"

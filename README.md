# thinkaosconfig
macbook air linux config files

https://askubuntu.com/questions/990218/camera-not-working-on-macbook-pro


## powerkey
sudo vi /etc/systemd/logind.conf
HandlePowerKey=ignore

## python env hell
### install autoenv
solved with autoenv?
$ git clone https://github.com/hyperupcall/autoenv ~/.autoenv
$ echo "source ~/.autoenv/activate.sh" >> ~/.bashrc

### install python virtualenv and enable in project
sudo apt install virtualenv
cd projectdir
virtualenv env

touch .env
echo "AUTOENV_ENABLE_LEAVE=" >> .env
echo "source env/bin/activate" >> .env

touch .env.leave
echo "deactivate" >> .env.leave


# thinhacks
unautomated hacks

# linkscript.sh
!!! DANGER !!!
swaps out original files with links for github update 

!will try to do a backup first!
this script makes links from ~/.config/ to this backup 


# bitmap fonts
(like artwiz)
- install artwiz
- run `fc-list |grep artwiz`
- run `xset fp+ /usr/share/fonts/artwiz-fonts-wl/` with directory from prev command
- `xset fp rehash`
- `fc-cache -fv`
- enable support for bitmap fonts (look at `/etc/fonts/conf.d/70-enable-bitmap` or something like that)



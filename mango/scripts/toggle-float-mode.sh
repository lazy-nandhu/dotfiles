#!/bin/bash

cd "/home/$USER/.config/mango"

rulefile="$(cat float.conf | grep "windowrule=isfloating:1,appid:.*")"

if [ "$rulefile" = "windowrule=isfloating:1,appid:.*" ]; then
    echo "" > float.conf
    echo "bind=SUPER,Return,spawn,foot" >> float.conf
else
    echo "windowrule=isfloating:1,appid:.*" > float.conf
    echo "windowrule=width:1000,height:500,appid:.*" >>float.conf
    echo "bind=SUPER,Return,spawn,foot" >> float.conf
fi

mmsg -d reload_config

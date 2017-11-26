# x11docker/mate
# 
# Run Mate desktop in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --desktop x11docker/mate
#           x11docker x11docker/mate caja

FROM debian:stretch
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils dbus-x11

# OpenGL support / MESA
RUN apt-get install -y mesa-utils mesa-utils-extra libxv1

# Language/locale settings
ENV LANG=en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/default/locale
RUN apt-get install -y locales

# some utils to have proper menus, mime file types etc.
RUN apt-get install -y --no-install-recommends xdg-utils xdg-user-dirs \
    menu menu-xdg mime-support desktop-file-utils

# Mate desktop core
RUN apt-get install -y --no-install-recommends mate-desktop-environment-core

# additional goodies
RUN apt-get install -y fortunes mate-applets mate-notification-daemon \
    mate-system-monitor mate-utils

# clean up
RUN rm -rf /var/lib/apt/lists/*

# create startscript 
RUN echo '#! /bin/bash\n\
[ -e "$HOME/.config" ] || cp -R /etc/skel/. $HOME/ \n\
exec mate-session \n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

CMD start

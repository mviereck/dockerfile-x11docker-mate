# x11docker/mate
# 
# Run Mate desktop in docker. 
# Use x11docker to run image. 
# Get x11docker from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --desktop x11docker/mate
#           x11docker x11docker/mate caja
#
# Options:
# Persistent home folder stored on host with   --home
# Shared host files with                       --share PATH
# Hardware acceleration with option            --gpu
# Clipboard sharing with option                --clipboard
# Sound support with option                    --alsa or --pulseaudio
#
# See x11docker --help for further options.

FROM debian:buster
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y dbus-x11 procps psmisc && \
    apt-get install -y xdg-utils xdg-user-dirs menu-xdg mime-support desktop-file-utils && \
    apt-get install -y mesa-utils mesa-utils-extra libxv1

# Language/locale settings
#   replace en_US by your desired locale setting, 
#   for example de_DE for german.
ENV LANG en_US.UTF-8
RUN echo $LANG UTF-8 > /etc/locale.gen && \
    apt-get install -y locales && \
    update-locale --reset LANG=$LANG

# Mate desktop core
RUN apt-get install -y --no-install-recommends mate-desktop-environment-core

# additional goodies
RUN apt-get install -y fortunes mate-applets mate-notification-daemon \
    mate-system-monitor mate-utils

CMD ["mate-session"]


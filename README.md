# x11docker/mate

Base image Mate desktop (on debian stretch)
 - Run Mate desktop in docker.
 - Use x11docker to run GUI applications and desktop environments in docker images. 
 - Get [x11docker from github](https://github.com/mviereck/x11docker)

# Command examples: 
 - Single application: `x11docker x11docker/mate caja`
 - Full desktop: `x11docker --desktop x11docker/mate`

# Options:
 - Persistent home folder stored on host with   `--home`
 - Shared host folder with                      `--sharedir DIR`
 - Hardware acceleration with option            `--gpu`
 - Clipboard sharing with option                `--clipboard`
 - Sound support with option                    `--alsa`
 - With pulseaudio in image, sound support with `--pulseaudio`
 - Language locale settings with                `--lang $LANG`

See `x11docker --help` for further options.

# Extend base image
To add your desired applications, create your own Dockerfile with this image as a base. Example:
```
FROM x11docker/mate
RUN apt-get update
RUN apt-get install -y midori
```

 # Screenshot
![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-mate.png "Mate desktop running in Xnest window using x11docker")
 


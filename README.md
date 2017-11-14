# x11docker/mate

Dockerfile containing Mate desktop
 - Run Mate desktop in docker. 
 - Use x11docker to run image to be able to run GUI applications and desktop environments in docker images. 
 - Get [x11docker from github](https://github.com/mviereck/x11docker)

# Example commands: 
 - Single application: `x11docker x11docker/mate caja`
 - Full desktop: `x11docker --desktop x11docker/mate`
  
# Extend base image
To add your desired applications, create your own Dockerfile `mydockerfile` with this image as a base. Example:
```
FROM x11docker/mate
RUN apt-get update
RUN apt-get install -y firefox
```
Build an image with `docker build -t mymate - < mydockerfile`. Run desktop with `x11docker --desktop mymate` or firefox only with `x11docker mymate firefox`.

 # Screenshot
![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-mate.png "Mate desktop running in Xnest window using x11docker")
 


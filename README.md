docker-freeciv-client
=====================
Docker image for a freeciv client.

Installation
============
To build from source, run the following from the root of this repo:

     docker build -t freeciv-client .

Usage
=====
With the following command the client is started in a container and exposed as a window on the host.
This mechanism is described in
http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/.

     docker run -ti --rm -e DISPLAY=$DISPLAY \
     -v /tmp/.X11-unix:/tmp/.X11-unix freeciv-client

In the game
===========
To connect to a server from within the client
"localhost" has to be replaced by the host server ip.

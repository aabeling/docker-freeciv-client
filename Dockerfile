FROM ubuntu:16.04

# http://freeciv.wikia.com/wiki/Building_Freeciv_from_source

RUN apt-get update 

RUN apt-get install -y freeciv-client-sdl 

# create a user
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# for german translations
RUN locale-gen de_DE.UTF-8
RUN update-locale LANG=de_DE.UTF-8
ENV LANG de_DE.UTF-8

USER developer
ENV HOME /home/developer

# run the client
CMD /usr/games/freeciv-sdl

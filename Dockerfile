FROM ubuntu:12.04
MAINTAINER pdevine
RUN apt-get update && apt-get install -y python-pip
RUN apt-get install -y freeglut3 libglu1 libfreetype6 libfreetype6 libavbin0 libopenal1
#RUN apt-get install -y libav-utils
RUN apt-get install -y fontconfig
RUN pip install pyglet

# This is for ubuntu 14.04, however pyglet and avbin don't work well together in 14.04
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

COPY run_game.py yoyo/run_game.py
COPY data/* yoyo/data/
COPY gamelib/*.py yoyo/gamelib/

USER developer
ENV HOME /home/developer

RUN echo 1 > /tmp/1
RUN echo 2 > /tmp/2
RUN echo 3 > /tmp/3
RUN echo 4 > /tmp/4
RUN echo 5 > /tmp/5
RUN echo 6 > /tmp/6
RUN echo 7 > /tmp/7
RUN echo 8 > /tmp/8
RUN echo 9 > /tmp/9
RUN echo 10 > /tmp/10
RUN echo 11 > /tmp/11
RUN echo 12 > /tmp/12
RUN echo 13 > /tmp/13
RUN echo 14 > /tmp/14
RUN echo 15 > /tmp/15
RUN echo 16 > /tmp/16
RUN echo 17 > /tmp/17
RUN echo 18 > /tmp/18
RUN echo 19 > /tmp/19
CMD cd /yoyo && python run_game.py

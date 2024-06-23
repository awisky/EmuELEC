#
# ~ Copyright © 2024 Agustin Wisky
#
FROM ubuntu:23.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc make git unzip wget xz-utils libsdl2-dev \
    libsdl2-mixer-dev libfreeimage-dev libfreetype6-dev \
    libcurl4-openssl-dev rapidjson-dev libasound2-dev \
    libgl1-mesa-dev build-essential libboost-all-dev cmake \
    fonts-droid-fallback libvlc-dev libvlccore-dev vlc-bin \
    texinfo premake4 golang libssl-dev curl patchelf xmlstarlet \
    default-jre xsltproc libvpx-dev sudo vim 
    #&& \
    #apt-get clean && \
    #rm -rf /var/lib/apt/lists/*
#add emuelec user with sudo rights with emuelec as password
RUN useradd -m -s /bin/bash emuelec && \
   echo "emuelec:emuelec" | chpasswd && \
   adduser emuelec sudo && \
   echo "emuelec ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /mnt/emuelec/

USER emuelec

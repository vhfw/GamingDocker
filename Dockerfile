FROM ubuntu

ENV HOME /root
WORKDIR /root

RUN	echo 'alias finalize_installation="winecfg && wine SteamSetup.exe"' >> /root/.bashrc && \
	echo 'alias steam="wine /root/.wine/drive_c/Program\ Files/Steam/Steam.exe -no-cef-sandbox > /dev/null"' >> /root/.bashrc

ENV WINEPREFIX /root/.wine
ENV WINEARCH win32

#Need to figure this out later
#ENV PULSE_SERVER unix:/run/user/1000/pulse/native

#disable interactive during package installation
ENV DEBIAN_FRONTEND noninteractive

#get 32-bit version of stuff
RUN	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends gpg-agent software-properties-common apt-transport-https wget && \
	add-apt-repository ppa:graphics-drivers/ppa && \
	wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && add-apt-repository https://dl.winehq.org/wine-builds/ubuntu/ && \
	apt-get update && \
	apt-get install -y --no-install-recommends initramfs-tools nvidia-460 cuda-drivers && \
	apt-get install -y --no-install-recommends winehq-stable cabextract unzip p7zip zenity && \
	wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && chmod +x winetricks && mv winetricks /usr/local/bin && \
	apt-get install -y --no-install-recommends winbind && \
	apt-get install -y --no-install-recommends p11-kit-modules:i386 && \
#libp11-kit-gnome-keyring:i386 && \
	apt-get install -y --no-install-recommends pulseaudio:i386 && \
	sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/daemon.conf && \
	sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

CMD ["/bin/bash"]

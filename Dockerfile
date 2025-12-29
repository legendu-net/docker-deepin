FROM bestwu/deepin:panda

RUN echo "deb http://mirrors.kernel.org/deepin/  panda main non-free contrib" > /etc/apt/sources.list \
    && apt-get -y update && apt-mark \
        hold iptables \
    && apt-get -y install apt-utils wget \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean

# language and fonts
ENV LANG en_US.utf8
RUN apt-get -y install locales-all fonts-arphic-uming

ARG url=https://download.nomachine.com/download/6.5/Linux/nomachine_6.5.6_9_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        dbus-x11 procps psmisc \
        at-spi2-core dconf-cli dconf-editor \
        gnome-themes-standard gtk2-engines-murrine gtk2-engines-pixbuf \
        mesa-utils mesa-utils-extra libxv1 kmod xz-utils \
        dde \
    && wget $url -O /nomachine.deb \
    && dpkg -i /nomachine.deb \
    && rm /nomachine.deb \
    && mkdir /root/.config \
    && apt-get autoremove -y \
    && apt-get autoclean

ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/games:/usr/games

# Remove dbus services failing or useless in container. (Bluetooth/bluez is most annoying)
RUN cd /usr/share/dbus-1/services \
    && rm \
        com.deepin.daemon.Audio.service \
        com.deepin.daemon.Bluetooth.service \
        com.deepin.daemon.InputDevices.service \
        com.deepin.daemon.Power.service \
        com.deepin.dde.welcome.service \
    && ln -s /etc/sv/gdm /var/service

EXPOSE 4000

COPY scripts /scripts

ENTRYPOINT ["/scripts/init.sh"]

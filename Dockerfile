FROM ubuntu:hirsute

# Activate i386 architecture and update Ubuntu
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install --no-install-recommends ca-certificates wget git make cmake build-essential libc6:i386 libncurses5:i386 libstdc++6:i386 minicom gpgv2 && \
    rm -rf /var/lib/apt/lists/*

# Download XC32 installer and install
RUN cd /tmp && \
    wget --content-disposition https://www.microchip.com/mplabxc32linux && \
    chmod +x xc32-v3.00-full-install-linux-installer.run && \
    ./xc32-v3.00-full-install-linux-installer.run --mode unattended --netservername localhost && \
    rm xc32-v3.00-full-install-linux-installer.run

RUN cd /opt && git clone https://github.com/sergev/pic32prog.git && ln -s /opt/pic32prog/linux64/pic32prog /usr/bin

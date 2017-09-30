# OpenVPN for pi

FROM armv7/armhf-debian:jessie
LABEL maintainer="Jay Hankins <jay@jayhankins.me>"

VOLUME /home-vpn-user

# Update packages and install software
RUN apt-get update \
    && apt-get install -y transmission-cli transmission-common transmission-daemon openvpn wget dumb-init\
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && groupmod -g 1000 users \
    && useradd -u 911 -U -d /home-vpn-user -s /bin/false vpn-user \
    && usermod -G users vpn-user

# Add configuration and scripts
ADD openvpn/ /etc/openvpn/

# Expose port and run
EXPOSE 9091
CMD ["dumb-init", "/etc/openvpn/start.sh"]

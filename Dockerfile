FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y dnsmasq
RUN echo 'user=root' > /etc/dnsmasq.conf
RUN echo 'interface=*' >> /etc/dnsmasq.conf
RUN echo 'keep-in-foreground' >> /etc/dnsmasq.conf

COPY ./01-dreamcast.conf /etc/dnsmasq.d
COPY ./01-dreamcast.conf /root
COPY ./startup.sh /

EXPOSE 53/udp

WORKDIR /

CMD ["./startup.sh"]

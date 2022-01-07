FROM pihole/pihole:2021.12.1
RUN apt update && apt install -y unbound

RUN curl -o /var/lib/unbound/root.hints https://www.internic.net/domain/named.root 

COPY lighttpd-external.conf /etc/lighttpd/external.conf 
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY start_unbound_and_s6_init.sh start_unbound_and_s6_init.sh

RUN chmod +x start_unbound_and_s6_init.sh
ENTRYPOINT ./start_unbound_and_s6_init.sh

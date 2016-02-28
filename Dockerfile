FROM anapsix/alpine-java
MAINTAINER Brian Hurlow <brian@brianhurlow.com>
RUN wget https://aphyr.com/riemann/riemann-0.2.10.tar.bz2
RUN tar xvfj riemann-0.2.10.tar.bz2
RUN ls 
COPY riemann.config /etc/riemann/
CMD /riemann-0.2.10/bin/riemann /etc/riemann/riemann.config

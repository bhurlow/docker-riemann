FROM anapsix/alpine-java
MAINTAINER Brian Hurlow <brian@brianhurlow.com>

# use lein to manage deps we want
# to use in our riemann.config
RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN ls
RUN mv lein /bin/lein
RUN chmod +x /bin/lein
RUN /bin/lein -v
ADD project.clj .
RUN lein deps

RUN lein run -m riemann.bin/-main riemann.config

# RUN wget https://aphyr.com/riemann/riemann-0.2.10.tar.bz2
# RUN tar xvfj riemann-0.2.10.tar.bz2
# RUN ls 
# COPY riemann.config /etc/riemann/
# CMD /riemann-0.2.10/bin/riemann /etc/riemann/riemann.config

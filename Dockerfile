#name of container: docker-jitsi-meet
#versison of container: 0.2.2
FROM quantumobject/docker-baseimage:15.10
MAINTAINER Angel Rodriguez  "angel@quantumobject.com"

#add repository and update the container
#Installation of nesesary package/software for this containers...
RUN echo 'deb http://download.jitsi.org/nightly/deb unstable/' >> /etc/apt/sources.list
RUN wget -qO - http://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add -
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q  host  \
                    && DEBIAN_FRONTEND=noninteractive apt-get install --fix-missing -y -q  jitsi-meet \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

##startup scripts  
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't 
#run it again ... use for conf for service ... when run the first time ...
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh


##Adding Deamons to containers
# to add nginx deamon to runit
RUN mkdir /etc/service/nginx
COPY nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# to allow access from outside of the container  to the container service
# at that ports need to allow access from firewall if need to access it outside of the server. 
EXPOSE 443 5275 10000-12500/tcp 10000-12500/udp

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# docker-jitsi-meet

Docker container for [jitsi-meet][3]

"Jitsi Meet is an open-source (MIT) WebRTC JavaScript application that uses Jitsi Videobridge to provide high quality, scalable video conferences."  "Jitsi Meet allows for very efficient collaboration. It allows users to stream their desktop or only some windows. It also supports shared document editing with Etherpad and remote presentations with Prezi."


## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -P quantumobject/docker-jitsi-meet

or

    $ docker run -d -p xxxxx:443 -p 5275:5275 -p 10000-20000:10000-20000 quantumobject/docker-jitsi-meet

Where xxxxx is the port assigned by you for the container if not docker will assigned one for it.

## Accessing the jitsi-meet applications:

After that check with your browser at addresses plus the port assigined by docker or you:

  - **http://host_ip:port/**

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash


## More Info

About jitsi-meet: [www.jitsi.org][1]

To help improve this container [docker-jitsi-meet][5]

Example of this [docker-jitsi-meet][6]

[1]:https://jitsi.org/
[2]:https://www.docker.com
[3]:https://jitsi.org/
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-jitsi-meet
[6]:https://www.quantumobject.com:32773

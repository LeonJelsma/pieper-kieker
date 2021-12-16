FROM ubuntu:bionic

COPY ./install.sh /run/install.sh
ADD ./gps-logging /home/pieperkieker/gps-logging

RUN chmod +x /run/install.sh
RUN /run/install.sh

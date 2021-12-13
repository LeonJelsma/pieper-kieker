FROM ubuntu:bionic
COPY ./init.sh /run/init.sh
ADD ./GPS_Logging /home/pieperkieker/GPS_Logging
ENTRYPOINT ["sh", "/run/init.sh"]

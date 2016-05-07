FROM ubuntu:14.04
RUN apt-get update && apt-get -y install rsync
RUN mkdir /code /code/log /etc/rsyncd/
ADD rsyncd.conf /etc/rsyncd/rsyncd.conf
ADD rsyncd.sh /code/rsyncd.sh
COPY run.sh /code
CMD /bin/bash /code/run.sh

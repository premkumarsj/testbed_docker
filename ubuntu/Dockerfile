FROM       ubuntu:18.04

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install ssh
RUN apt-get -y install curl && apt-get -y install wget
RUN apt-get -y install vim 
RUN apt-get -y install iputils-ping
RUN apt-get -y install traceroute
RUN apt-get -y install tcpdump
RUN apt-get -y install python3.7 
RUN apt-get -y install python-pip
RUN apt-get -y install apache2-utils

RUN echo 'PS1=ubuntu#' >> /root/.bashrc

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

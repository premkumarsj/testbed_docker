FROM       ubuntu:18.04

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh
RUN apt-get -y update && apt-get -y upgrade && \ 
    apt-get -y install ssh &&  \ 
    apt-get -y install curl && \
    apt-get -y install wget && \
    apt-get -y install vim && \  
    apt-get -y install iputils-ping && \
    apt-get -y install traceroute && \
    apt-get -y install tcpdump && \
    apt-get -y install python3.7 && \
    apt-get -y install python-pip && \
    apt-get -y install apache2-utils && \
    apt-get -y install net-tools && \
    apt-get -y install unzip

RUN wget https://github.com/grafov/hulk/archive/master.zip && \
    unzip master.zip


RUN echo 'PS1=ubuntu#' >> /root/.bashrc

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

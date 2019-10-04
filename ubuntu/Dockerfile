FROM       ubuntu:18.04
ENV TZ=Asia/Kolkata
COPY ./tools/ /root/tools

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \ 
    echo 'root:freebsd' |chpasswd  && \ 
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh 
    
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    
RUN apt-get -y install ssh &&  \ 
    apt-get -y install curl && \
    apt-get -y install wget && \
    apt-get -y install supervisor &&\
    apt-get -y install vim && \  
    apt-get -y install iputils-ping && \
    apt-get -y install traceroute && \
    apt-get -y install tcpdump && \
    apt-get -y install python3.7 && \
    apt-get -y install python-pip && \
    apt-get -y install apache2-utils && \
    apt-get -y install net-tools && \
    apt-get -y install unzip && \ 
    apt-get -y install hping3 && \
    apt-get -y install apache2 && \
    pip install scapy && \
    echo 'PS1=ubuntu~]#' >> /root/.bashrc 


COPY ./html/ /var/www/html/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUN apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
#CMD    ["/usr/sbin/sshd", "-D"]

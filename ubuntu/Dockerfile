FROM       ubuntu:18.04
ENV TZ=Asia/Kolkata
COPY ./tools/ /root/tools

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \ 
    echo 'root:freebsd' |chpasswd  && \ 
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh 
    
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    
RUN apt-get -y install ssh &&  \ 
    apt-get -y install sshpass && \
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

RUN wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz &&\
    tar -xvf go1.12.7.linux-amd64.tar.gz && \
    mv go /usr/local 
ENV GOROOT /usr/local/go 
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

#Enable CGI Access
RUN cd /etc/apache2/mods-enabled && \
    ln -s ../mods-available/cgi.load

COPY ./html/ /var/www/html/
COPY ./cgi-bin/ /usr/lib/cgi-bin/

#Scapy Scripts for TCP
RUN sshpass -p "atsuser" scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r atsuser@10.102.1.98:/export/home/atsuser/Scripts/TCP/ScapyScripts/SACK.tar.gz /root/

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUN apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
#CMD    ["/usr/sbin/sshd", "-D"]

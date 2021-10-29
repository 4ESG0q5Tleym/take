FROM debian
RUN apt update
RUN apt install ssh wget npm -y
RUN mkdir /opt/
RUN mkdir /opt/ws
RUN wget https://github.com/erebe/wstunnel/releases/download/v4.0/wstunnel-x64-linux -o /opt/ws/wstunnel
RUN mkdir /run/sshd
RUN echo './wstunnel --server wss://0.0.0.0:443 --restrictTo=127.0.0.1:1&' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:setpassword|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80 443 22
CMD  /1.sh

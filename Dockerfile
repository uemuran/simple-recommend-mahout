# simple service start.
FROM uemura/mysql
MAINTAINER uemuran <uemura.yusuke@gmail.com>

RUN echo "service sshd start" >> /usr/local/bin/startup.sh
RUN echo "service mysql start" >> /usr/local/bin/startup.sh
RUN echo "tail -f /dev/null" >> /usr/local/bin/startup.sh
RUN chmod a+x /usr/local/bin/startup.sh

# add ssh setting.
ADD .ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod -R 600 /root/.ssh

EXPOSE 22
EXPOSE 3306

CMD /usr/local/bin/startup.sh

FROM    centos:7
COPY    mongodb.repo /etc/yum.repos.d
RUN     yum install -y mongodb-org bind-utils nc
COPY    catalogue.js /tmp
COPY    users.js  /tmp
COPY    run.sh /tmp
RUN     chmod +x /tmp/run.sh
CMD     /tmp/run.sh

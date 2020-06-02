FROM    centos:7
COPY    mongo.repo /etc/yum.repos.d/mongodb-org-4.2.repo
RUN     yum install -y mongodb-org bind-utils nc
COPY    catalogue.js /tmp
COPY    users.js  /tmp
COPY    run.sh /tmp
RUN     chmod +x /tmp/run.sh
CMD     /tmp/run.sh

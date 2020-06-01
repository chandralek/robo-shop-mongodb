FROM    centos:7
COPY    mongo.repo /etc/yum.repos.d/mongodb-org-4.2.repo
RUN     yum install -y mongodb-org bind-utils nc
COPY    catalogue.js /
COPY    users.js  /
COPY    run.sh /
RUN     chmod +x /run.sh
CMD     /run.sh

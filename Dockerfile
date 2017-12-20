FROM registry.access.redhat.com/rhel7:latest
MAINTAINER Raj Shah <raj.shah@tdameritrade.com>


RUN rm /etc/yum/pluginconf.d/subscription-manager.conf \
        && rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-EPEL-7 \
        && rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-puppetlabs \
        && rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-redhat-release \
        && rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-reductive \
        #rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-foreman \

RUN rm -f /etc/yum.repos.d/redhat.repo 
COPY tda-yum_master.repo /etc/yum.repos.d/tda-yum.repo

RUN yum -y upgrade && yum -y install tar && yum clean all && yum makecache

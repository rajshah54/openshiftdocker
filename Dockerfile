FROM registry.access.redhat.com/rhel7:latest
MAINTAINER Mahesh Gurugunti <mahesh.gurugunti@tdameritrade.com>


#RUN rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-EPEL-7 && \
#        rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-puppetlabs && \
#        rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-redhat-release && \
#        rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-reductive
#        #rpm --import http://prdtxlvyumas02.associatesys.local/yumrepos/mrepo/rhel-7-x86_64/RPM-GPG-KEY/RPM-GPG-KEY-foreman && \

#RUN rm -f /etc/yum.repos.d/redhat.repo 
RUN ls -lrt /etc/yum.repos.d/ && cat /etc/yum.repos.d/redhat.repo
#&& subscription-manager config --rhsm.manage_repos=0

#COPY tda-yum_master.repo /etc/yum.repos.d/tda-yum.repo
RUN yum clean all 
RUN yum-config-manager --disablerepo=rhel-7-server-rt-beta-rpms 

RUN yum -v repolist

#RUN yum clean all && yum makecache && yum -y upgrade && yum -y install tar

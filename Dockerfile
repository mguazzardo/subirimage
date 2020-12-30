FROM centos:centos7
MAINTAINER Marcelo Guazzardo <mguazzardo76@gmail.com>
RUN yum -y install openssh-server initscripts sudo
RUN sshd-keygen 
RUN echo 'root:master' | chpasswd 
RUN useradd -m user1 && echo 'user1:master' | chpasswd
ADD ./sudoers /etc/sudoers
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

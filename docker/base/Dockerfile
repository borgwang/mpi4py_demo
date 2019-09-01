FROM ubuntu:16.04
MAINTAINER borgwang
USER root

RUN apt-get update
RUN apt-get install -y software-properties-common vim wget tar openssh-server sshpass
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y build-essential python3.6 python3.6-dev python3.6-venv

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN rm get-pip.py

RUN /etc/init.d/ssh start
EXPOSE 22
RUN /etc/init.d/ssh restart

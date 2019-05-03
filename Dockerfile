FROM jenkins/jenkins:2.175

# change user to root to install some tools
USER root
RUN apt-get update
RUN apt install python3-pip jq -y
RUN pip3 install awscli --upgrade
USER jenkins

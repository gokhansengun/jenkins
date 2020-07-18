FROM jenkins/jenkins:2.235.2-lts

# change user to root to install some tools
USER root
RUN apt-get update -y \
 && apt-get install python3-pip jq libltdl7 -y \
 && apt-get clean -y
RUN pip3 install awscli --upgrade
USER jenkins

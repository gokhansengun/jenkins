FROM jenkins/jenkins:2.254

# change user to root to install some tools
USER root
RUN apt-get update -y \
 && apt-get install python3-pip jq libltdl7 netcat -y \
 && apt-get clean -y
RUN pip3 install awscli --upgrade

RUN curl -L https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq

# overrite install-plugins
COPY scripts/install-plugin.sh /usr/local/bin/install-plugins.sh

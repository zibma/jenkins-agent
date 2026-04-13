FROM jenkins/inbound-agent:3355.v388858a_47b_33-17

USER root

# Install yq v4
# RUN curl -fsSL -o /usr/local/bin/yq \
#       https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
#     && chmod +x /usr/local/bin/yq

# Install gh CLI (direct binary, no apt needed)


USER jenkins

# Update - START
RUN sudo apt update -y
# Update - END

# Install Curl - START
RUN sudo apt install curl -y
# Install Curl - END

# Install Git - START
RUN sudo apt install git -y
# Install Git - END

# Install Wget - START
RUN sudo apt install wget -y
# Install Wget - END

# Install Zip - START
RUN sudo apt install zip -y
# Install Zip - END

# Install Unzip - START
RUN sudo apt install unzip -y
# Install Unzip - END

# Install Python - START
RUN sudo apt install python3 -y
RUN sudo apt install python-is-python3 -y
RUN sudo apt-get -y install python3-pip
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# Install Python - END

RUN curl -fsSL https://github.com/cli/cli/releases/download/v2.72.0/gh_2.72.0_linux_amd64.tar.gz \
    | tar -xz -C /tmp \
    && mv /tmp/gh_2.72.0_linux_amd64/bin/gh /usr/local/bin/gh \
    && rm -rf /tmp/gh_*

FROM jenkins/inbound-agent:latest-jdk17


USER root

# 1. Consolidate apt installs to keep the image slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    wget \
    zip \
    unzip \
    python3 \
    python-is-python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 2. Set environment variables
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# 3. Install gh CLI
RUN curl -fsSL https://github.com/cli/cli/releases/download/v2.42.1/gh_2.42.1_linux_amd64.tar.gz \
    | tar -xz -C /tmp \
    && mv /tmp/gh_2.42.1_linux_amd64/bin/gh /usr/local/bin/gh \
    && rm -rf /tmp/gh_*

# 4. Switch back to the jenkins user at the end
USER jenkins

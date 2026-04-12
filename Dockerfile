FROM jenkins/inbound-agent:3355.v388858a_47b_33-17

USER root

# Install yq v4
RUN curl -fsSL -o /usr/local/bin/yq \
      https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    && chmod +x /usr/local/bin/yq

# Install gh CLI (direct binary, no apt needed)
RUN curl -fsSL https://github.com/cli/cli/releases/download/v2.72.0/gh_2.72.0_linux_amd64.tar.gz \
    | tar -xz -C /tmp \
    && mv /tmp/gh_2.72.0_linux_amd64/bin/gh /usr/local/bin/gh \
    && rm -rf /tmp/gh_*

USER jenkins

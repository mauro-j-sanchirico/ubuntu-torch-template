FROM ubuntu:latest

ARG USERNAME=developer
ARG GROUPNAME=$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user; adapted from:
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd -f $USERNAME \
    && useradd -m -s /bin/bash -g $GROUPNAME $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install basic packages
RUN apt-get -y update \
    && apt-get install -yq curl vim git python3 python3-pip npm \
    && apt-get clean

RUN ln -sf /usr/bin/python3 /usr/bin/python

# Enable sudo for root
RUN echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the default user.
USER $USERNAME

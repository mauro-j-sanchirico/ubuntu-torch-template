FROM nvidia/cuda:12.6.2-cudnn-devel-ubuntu20.04

# FROM ubuntu:latest

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

# Enable sudo for root
RUN echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

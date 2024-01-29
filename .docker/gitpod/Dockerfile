# Based on the Dockerfile for `leanprovercommunity/mathlib:gitpod`
# with Dafny help from https://github.com/arranstewart-dev/dafny-gitpod

FROM ubuntu:jammy

USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install sudo git curl wget git bash-completion python3 python3-pip mono-complete -y && apt-get clean

RUN pip3 install requests

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
USER gitpod
WORKDIR /home/gitpod

SHELL ["/bin/bash", "-c"]

# gitpod bash prompt
RUN { echo && echo "PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") $ '" ; } >> .bashrc

# fix the infoview when the container is used on gitpod:
ENV VSCODE_API_VERSION="1.50.0"

# ssh to github once to bypass the unknown fingerprint warning
RUN ssh -o StrictHostKeyChecking=no github.com || true

# install dotnet
RUN \
 wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
 && sudo apt install $PWD/packages-microsoft-prod.deb \
 && rm packages-microsoft-prod.deb \
 && sudo apt-get update \
 && sudo apt-get install -y apt-transport-https \
 && sudo apt-get update \
 && sudo apt-get install -y dotnet-sdk-6.0 \
 && apt-get clean \
 && rm -rf /var/cache/apt/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* \
 && rm -rf /var/tmp/*

# run sudo once to suppress usage info
RUN sudo echo finished


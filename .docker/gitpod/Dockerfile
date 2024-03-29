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
RUN sudo ssh -o StrictHostKeyChecking=no github.com || true

# install dotnet
RUN sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN sudo apt-get install $PWD/packages-microsoft-prod.deb
RUN sudo apt-get install -y apt-transport-https dotnet-sdk-6.0 && sudo apt-get clean

# run sudo once to suppress usage info
RUN sudo echo finished


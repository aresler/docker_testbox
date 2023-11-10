FROM ubuntu:22.04

ENV TZ=Europe/Amsterdam
ENV USER=andrew
ENV PASSWD=123qwe
ENV HOME=/home/$USER
ENV CONDA_INSTALLER_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone

RUN apt update && \
	apt install -y sudo openssh-server \
	python3 \
	python3-distutils \
	python3-pip \
	python3-venv \
	iputils-ping \
	vim \
	ranger \
	net-tools \
	netcat \
	lsof \
	curl \
	git

RUN /usr/bin/python3 -m pip install pytest

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -m -s /bin/bash $USER; usermod -aG root $USER; echo "$USER:$PASSWD" | chpasswd && \
	echo "$USER  ALL=(ALL:ALL) ALL" >> /etc/sudoers

WORKDIR $HOME

COPY _profile .
# TODO: Generalize custom script name
RUN chown -R $USER:$USER . && \
    echo "source ~/.an.bashrc" >> .bashrc

USER andrew
RUN curl $CONDA_INSTALLER_URL -o miniconda3.sh && \
    chmod +x miniconda3.sh && \
    ./miniconda3.sh -b

## Commented out because shell init produces an error at this point
# RUN miniconda3/bin/conda init -q && \
#     miniconda3/bin/conda config --set auto_activate_base false

RUN mkdir -p ./projects

USER root
COPY remote-test/entrypoint.sh /tmp
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 22

CMD ["/tmp/entrypoint.sh"]

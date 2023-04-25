FROM ubuntu

ENV TZ=Europe/Amsterdam
ENV HOME=/root

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	echo $TZ > /etc/timezone

RUN apt update && \
	apt install -y sudo python3 python3-distutils python3-pip vim ranger

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR $HOME

COPY _profile .
# TODO: Generalize custom script name
RUN echo "source ~/.an.bashrc" >> .bashrc

COPY jupyter-test/requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir -p .jupyter
COPY jupyter-test/jupyter_notebook_config.py .jupyter

EXPOSE 8888

CMD ["/usr/bin/python", "-m", "jupyter", "notebook", "--allow-root"]

FROM debian:stretch-slim

MAINTAINER R.E.M. & co



####  Install utilities  ####

RUN apt-get update --fix-missing && apt-get install -y wget 




####  Conda install  ####

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

# Update to latest conda version
RUN conda update -n base -c defaults conda




####  Install Jupyterlabs  ####

RUN conda install -c conda-forge jupyterlab
EXPOSE 8888


RUN conda install -c conda-forge torch fastai2 


####  Set up jupyterlabs user  ####

 # Set up jluser
RUN useradd -m jluser

# Set up our notebook config.
COPY dockerconfig/jupyter_notebook_config.py /home/jluser/.jupyter/
COPY dockerconfig/run_jupyterlab.sh /home/jluser/
RUN chown jluser /home/jluser/.jupyter/jupyter_notebook_config.py
RUN chown jluser /home/jluser/run_jupyterlab.sh

# Usermod needs to happen before using it
ARG AUID
RUN usermod -u ${AUID} jluser 
# See https://stackoverflow.com/questions/29245216/write-in-shared-volumes-docker

RUN chown -R jluser /home/jluser/.jupyter
RUN chgrp -R jluser /home/jluser/.jupyter

USER jluser
RUN chmod u+x /home/jluser/run_jupyterlab.sh
ENV PATH /opt/conda/bin:$PATH

WORKDIR "/home/jluser/data"




#### Start jupyterlabs

CMD [ "../run_jupyterlab.sh" ]

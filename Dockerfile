# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/rstudio-notebook:2025.3-2025.3

FROM $BASE_CONTAINER

LABEL maintainer="https://github.com/ucsd-ets/math11-notebook"

# 2) change to root to install packages
USER root

RUN R -e "install.packages('car')"
#RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

#RUN pip install --no-cache-dir networkx scipy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]

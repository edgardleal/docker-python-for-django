FROM ubuntu:18.04

WORKDIR /app/

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y software-properties-common curl \
    && add-apt-repository ppa:ubuntugis/ubuntugis-unstable && apt-get update \
    && apt-get install -y  python3.8 python3-pip libssl-dev libffi-dev python3-gdal \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y binutils libproj-dev gdal-bin postgis gettext libmysqlclient-dev
RUN pip3 install pip --upgrade

RUN apt-get install -y \
  locales && \
  locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN pip3 install Django==3.0.6 mysqlclient==2.0.1
EXPOSE 8000

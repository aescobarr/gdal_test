FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --allow-unauthenticated \
    autoconf \
    automake \
    bash \
    ccache \
    cmake \
    curl \
    doxygen \
    fossil \
    g++ \
    git \
    gpsbabel \
    libblosc-dev \
    libboost-dev \
    libcairo2-dev \
    libcfitsio-dev \
    libcrypto++-dev \
    libcurl4-gnutls-dev \
    libexpat-dev \
    libfcgi-dev \
    libfyba-dev \
    libfreexl-dev \
    libgeos-dev \
    libgeotiff-dev \
    libgif-dev \
    libhdf4-alt-dev \
    libhdf5-serial-dev \
    libjpeg-dev \
    libkml-dev \
    liblcms2-2 \
    liblz4-dev \
    liblzma-dev \
    libmysqlclient-dev \
    libnetcdf-dev \
    libogdi-dev \
    libopenexr-dev \
    libopenjp2-7-dev \
    libpcre3-dev \
    libpng-dev \
    libpoppler-dev \
    libpoppler-private-dev \
    libpq-dev \
    libproj-dev \
    librasterlite2-dev \
    libspatialite-dev \
    libssl-dev \
    libwebp-dev \
    libxerces-c-dev \
    libxml2-dev \
    libxslt-dev \
    libzstd-dev \
    locales \
    mysql-client-core-8.0 \
    netcdf-bin \
    openjdk-8-jdk \
    poppler-utils \
    postgis \
    postgresql-client \
    python3-dev \
    python3-numpy \
    python3-pip \
    sqlite3 \
    swig \
    unixodbc-dev \
    wget \
    zip

COPY ./gdal /gdal
WORKDIR /gdal
#COPY requirements.txt /tmp/
RUN python3 -m pip install -U -r /gdal/autotest/requirements.txt
RUN mkdir build && cd build && cmake .. && cmake --build . && cmake --build . --target install


FROM python:3.9-alpine
LABEL maintainer="javier@javierleon.dev"
ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN apk --no-cache --update-cache add \
    openssh-client git make automake \
    gcc gfortran unixodbc unixodbc-dev \
    sqlite-libs python3 libpq libxml2-dev \
    jpeg-dev  postgresql-dev libxslt-dev \
    libffi-dev python3-dev py-pip build-base \
    wget musl-dev  openblas-dev \
    libmemcached-dev rust && \ 
    ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && mkdir -p /home/ubuntu/symbits \
    && mkdir -p /var/log/troc/ 
RUN apk add --no-cache \
    gcc \
    musl-dev && \
    pip install pylint==2.7.4 \
    pycodestyle==2.7.0 \
    flake8==3.9.0 \
    black==20.8.b1 \
    mypy==0.812 \
    isort==5.8.0 \
    navconfig \
    navigator-api \
    asyncdb
    

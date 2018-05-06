FROM buildpack-deps:jessie

RUN apt update

RUN apt install git build-essential automake libcurl4-openssl-dev -y && \
    git clone -b release https://github.com/roswell/roswell.git && \
    cd roswell && \
    sh bootstrap && \
    ./configure && \
    make && \
    make install && \
    ros setup && \
    ros install sbcl || true

FROM node:13-stretch

RUN apt-get update && apt-get install -y autoconf automake libtool curl make g++ unzip

RUN cd /tmp \
    && curl -L -o /tmp/proto.tar.gz https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-python-3.6.1.tar.gz \
    && tar -xvf /tmp/proto.tar.gz \
    && cd protobuf-3.6.1 \
    && ./configure \
    && make && make check && make install && ldconfig \
    && rm -rf /tmp/proto*

RUN npm install -g protobufjs semver minimist chalk glob uglify-js espree escodegen estraverse

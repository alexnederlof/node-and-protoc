FROM node:14-stretch

RUN apt-get update && apt-get install -y autoconf automake libtool curl make g++ unzip

RUN cd /tmp \
    && curl -L -o /tmp/proto.tar.gz https://github.com/protocolbuffers/protobuf/releases/download/v3.12.3/protobuf-python-3.12.3.tar.gz \
    && tar -xvf /tmp/proto.tar.gz \
    && cd protobuf-3.12.3 \
    && ./configure \
    && make && make check && make install && ldconfig \
    && rm -rf /tmp/proto*

RUN npm install -g protobufjs semver minimist chalk glob uglify-js espree escodegen estraverse

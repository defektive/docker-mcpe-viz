FROM phusion/baseimage:0.11

RUN apt-get update &&  \
    apt-get install -y make unzip cmake g++ libz-dev libpng-dev libxml2-dev qt4-qmake

ARG MCPE_VIZ_URL=https://github.com/Plethora777/mcpe_viz/archive/master.zip
RUN mkdir -p /usr/local/src/ \
    && cd /usr/local/src/ \
    && curl -sL --fail -o mcpe_viz.zip ${MCPE_VIZ_URL}  \
    && unzip mcpe_viz.zip  \
    && cd mcpe_viz-master  \
    && curl -sL --fail -o leveldb-mcpe.zip https://github.com/Mojang/leveldb-mcpe/archive/master.zip  \
    && curl -sL --fail -o libnbtplusplus.zip https://github.com/ljfa-ag/libnbtplusplus/archive/master.zip  \
    && unzip leveldb-mcpe.zip \
    && unzip libnbtplusplus.zip \
    && mv leveldb-mcpe-master leveldb-mcpe \
    && mv libnbtplusplus-master libnbtplusplus \
    && cd leveldb-mcpe \
    && make \
    && cd ../libnbtplusplus \
    && mkdir build \
    && cd build \
    && cmake .. -DNBT_BUILD_TESTS=OFF \
    && make \
    && cd ../.. \
    && make \
    && cp -r images build/images

WORKDIR /usr/local/src/mcpe_viz-master

# build/mcpe_viz --db /tmp/world/ --out /tmp/out/map --html-all
# maybe add qt4-default to the above packages and run this
#RUN cd gui && qmake && make


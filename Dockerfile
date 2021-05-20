#!/bin/sh

FROM ubuntu:18.04


ENV PROJECT_PATH=/home

RUN apt-get update && \
    apt-get install -y apt-utils make git bash gcc g++
WORKDIR $PROJECT_PATH
COPY . $PROJECT_PATH
WORKDIR /home/lora/rak2247_usb
RUN ./install.sh
ENV RUN_PATH=/opt/ttn-gateway/packet_forwarder/lora_pkt_fwd
WORKDIR $RUN_PATH
CMD ./lora_pkt_fwd

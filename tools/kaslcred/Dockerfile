FROM python:3.11.2-buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get dist-upgrade -y

# Install dependencies and required tools
RUN apt-get install -y \
    git \
    libsodium-dev \
    python3-nacl

RUN python3 -m pip install --upgrade pip
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y


run export PATH="$HOME/.cargo/bin:$PATH" && python3 -m pip install keri==0.6.8

WORKDIR /keri


FROM rust:1.89.0

RUN apt-get update && apt-get install -y protobuf-compiler
# RUN apt-get install apt-transport-https curl gnupg vim -y

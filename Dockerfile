FROM debian:latest

# prepare
RUN apt-get -y update
RUN apt-get -y install apt-utils

# install curl, http://stackoverflow.com/questions/27273412/cannot-install-packages-inside-docker-ubuntu-image
RUN apt-get -y install curl

RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
RUN gunzip elm.gz
RUN chmod +x elm
RUN mv elm /usr/local/bin/

# make elm reactor and nginx accessible
EXPOSE 8000

WORKDIR /usr/src/app

COPY . .

RUN elm make src/Main.elm

# run web servers:
CMD ["elm", "reactor"]

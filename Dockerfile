FROM ubuntu
MAINTAINER Patrick O'Doherty <p@trickod.com>

RUN apt-get -y update
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev curl
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN curl -L ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2 | tar -xj -C /tmp
RUN cd /tmp/ruby-2.0.0-p247 && ./configure --disable-install-doc && make install clean

ENV LC_ALL en_US.UTF-8

RUN rm -r /tmp/ruby-2.0.0-p247

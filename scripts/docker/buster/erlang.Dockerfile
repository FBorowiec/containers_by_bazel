FROM bazel/dependencies:buster-base

RUN apt-get install -y --no-install-recommends gnupg dirmngr
RUN apt-key adv --no-tty --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-key 0xD208507CA14F4FCA
RUN echo "deb http://binaries.erlang-solutions.com/debian buster contrib" > /etc/apt/sources.list.d/erlang.list

RUN apt-get update
RUN apt-get purge -y gnupg dirmngr
RUN apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y

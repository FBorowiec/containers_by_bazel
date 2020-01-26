FROM bazel/base:buster

RUN echo "deb http://snapshot.debian.org/archive/debian/20200126 buster main" > /etc/apt/sources.list
RUN echo "deb http://snapshot.debian.org/archive/debian/20200126 buster-updates main" >> /etc/apt/sources.list
RUN echo "deb http://snapshot.debian.org/archive/debian-security/20200126 buster/updates main" >> /etc/apt/sources.list

RUN echo "deb http://snapshot.debian.org/archive/debian/20200126 buster-backports main" > /etc/apt/sources.list.d/backports.list

RUN apt-get update
RUN apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y

ADD find_deps.sh /

FROM	ubuntu:14.04.5
MAINTAINER	BPI  "BPI-SINOVOIP"

RUN	apt-get update && apt-get install -y \
	openjdk-7-jdk \
	git-core \
	gnupg \
	flex \
	bison \
	gperf \
	build-essential \
	zip \
	curl \
	zlib1g-dev \
	gcc-multilib \
	g++-multilib \
	libc6-dev-i386 \
	lib32ncurses5-dev \
	x11proto-core-dev \
	libx11-dev \
	lib32z-dev \
	ccache \
	libgl1-mesa-dev \
	libxml2-utils \
	xsltproc \
	unzip \
	mkisofs \
	u-boot-tools \
	bc \
	gawk \
	busybox \
	openssh-server \
	vim

ADD	dtc /usr/bin/dtc

RUN	mkdir /var/run/sshd
RUN	echo 'root:root' | chpasswd
RUN 	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN 	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME	["/media"]

EXPOSE	22

CMD	["/usr/sbin/sshd", "-D"]

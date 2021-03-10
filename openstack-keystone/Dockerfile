from centos:7

ENV BRANCH="stable/victoria"

MAINTAINER Semen Mesilov smesilov@croc.ru

# Install OS dependencies

RUN yum install -y python3 python3-devel python3-pip git httpd && \
    yum -y group install "Development Tools" && \
    yum clean all

# Install code dependencies
RUN pip3 install --user --upgrade pip && \
    git clone https://github.com/smesilov-dev/keystone.git && \
    cd keystone && \
    git checkout ${BRANCH} && \
    pip3 install . && \
    pip3 install PyMySQL

# Copy init script
COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

# Configure keystone user
RUN useradd keystone

ENTRYPOINT ["/docker-entrypoint.sh"]

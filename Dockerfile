FROM phusion/baseimage:0.9.10
MAINTAINER Open Knowledge

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

ENV HOME /root
ENV CKAN_HOME /usr/lib/ckan/default
ENV CKAN_CONFIG /etc/ckan/default
ENV CKAN_DATA /var/lib/ckan
ENV CKAN_ERROR_EMAIL_FROM ckan@example.org
ENV CKAN_ERROR_EMAIL ckan@example.org
ENV CKAN_ADMIN_USER ckan
ENV CKAN_ADMIN_PASS ckan

ENV CKAN_DATASTORE_READPASS datastore
ENV CKAN_DATASTORE_WRITEPASS datastore
ENV CKAN_DATASTORE_DB datastore
ENV CKAN_DATASTORE_READER ds_reader
ENV CKAN_DATASTORE_WRITER ds_writer

# Install required packages
RUN apt-get -q -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
        python-minimal \
        python-dev \
        python-virtualenv \
        libevent-dev \
        libpq-dev \
        nginx-light \
        apache2 \
        libapache2-mod-wsgi \
        libxml2-dev \
        libxslt1-dev \
        postfix \
        postgresql-client \
        expect \
        expect-dev \
        build-essential

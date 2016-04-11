FROM ubuntu
MAINTAINER Thomas Coats <t.coats@metocean.co.nz>

ADD . /install/
RUN /install/install.sh
CMD ["/sbin/initsh"]
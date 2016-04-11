FROM metocean/aroha:v1.0.0
MAINTAINER Thomas Coats <thomas@metocean.co.nz>

ADD . /install/
RUN /install/install.sh
CMD ["/sbin/initsh"]
# FROM sdhibit/rpi-raspbian
FROM cellofellow/rpi-arch
MAINTAINER Lajos Koszti <ajnasz@ajnasz.hu>
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm nodejs python2 couchdb
ENV PYTHON /usr/bin/python2
# RUN adduser --disabled-password --gecos "" sinopia
RUN useradd -m sinopia
RUN passwd -d sinopia
RUN mkdir -p /opt/sinopia/storage
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
WORKDIR /opt/sinopia
RUN npm install js-yaml sinopia 
# ADD /config_gen.js /opt/sinopia/config_gen.js
ADD /start.sh /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873

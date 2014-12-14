# FROM sdhibit/rpi-raspbian
FROM ajnasz/rpi-node
MAINTAINER Lajos Koszti <ajnasz@ajnasz.hu>
RUN useradd -m sinopia
RUN passwd -d sinopia
RUN mkdir -p /opt/sinopia/storage
RUN chown -R sinopia:sinopia /opt/sinopia
RUN pacman -S --noconfirm couchdb
USER sinopia
WORKDIR /opt/sinopia
RUN npm install js-yaml sinopia 
# ADD /config_gen.js /opt/sinopia/config_gen.js
ADD /start.sh /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873

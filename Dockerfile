FROM unit9/base

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1655A0AB68576280 \
    && curl https://deb.nodesource.com/setup_10.x --output /tmp/node_setup \
    && bash /tmp/node_setup \
    && rm /tmp/node_setup \
    && apt-get install -y nodejs \
    && adduser --system --no-create-home --disabled-login --group app

WORKDIR /app

ADD config/run /etc/service/backend/run

ADD node_modules /app/node_modules
ADD index.html index.js /app/

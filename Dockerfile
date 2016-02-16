FROM alpine:latest
MAINTAINER Michal Rostecki <michal.rostecki@gmail.com>

RUN apk add --no-cache \
        git \
        nodejs

RUN addgroup ircanywhere \
    && adduser -D -G ircanywhere ircanywhere  \
    && mkdir -p /opt/ircanywhere \
    && chown -R ircanywhere: /opt/ircanywhere
USER ircanywhere

RUN git clone https://github.com/ircanywhere/ircanywhere /opt/ircanywhere

WORKDIR /opt/ircanywhere
RUN npm install \
    && npm run gulp

ADD config.js /opt/ircanywhere/config.js

CMD ["npm", "start"]

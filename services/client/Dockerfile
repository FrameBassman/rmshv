FROM node:8.11.3

ENV NPM_CONFIG_LOGLEVEL warn

WORKDIR /var/lib/romashov/client

COPY ./package.json /tmp/package.json
COPY ./package-lock.json /tmp/package-lock.json
RUN cd /tmp && npm install
RUN mv /tmp/node_modules ../node_modules
ENV PATH /var/lib/romashov/node_modules/.bin:$PATH

COPY . .

CMD npm run build

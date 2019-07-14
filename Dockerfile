FROM node:8-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

ENV PATH=$PATH:/home/node/.npm-global/bin

USER node

RUN npm install pm2 -g

RUN npm install --only=production

COPY . .

EXPOSE 3000

CMD ["pm2-runtime", "dist/server.js", "-i", "max"]

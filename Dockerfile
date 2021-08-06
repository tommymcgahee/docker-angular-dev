ARG NODE=14.17.4

FROM node:$NODE

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

EXPOSE 4200

RUN npm i npm@latest -g 
# RUN npm i @angular/cli@^12.2.0 -g

RUN mkdir /opt/node_app && chown node:node /opt/node_app
WORKDIR /opt/node_app

USER node
COPY --chown=node:node package.json package-lock.json* ./
RUN npm install --no-optional && npm cache clean --force

WORKDIR /opt/node_app/app
COPY --chown=node:node . .

CMD cd ./app && npm run serve
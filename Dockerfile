ARG CUSTOM_NODE_VERSION

FROM node:$CUSTOM_NODE_VERSION

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install -g @angular/cli 

COPY . ./

CMD cd ./app && ng serve --host 0.0.0.0 --port 4200
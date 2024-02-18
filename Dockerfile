FROM node:16.14-alpine AS build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

RUN yarn build

FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY ./dist/my-angular-app/ .

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

FROM node:18.14.0-alpine3.17 AS builder

RUN mkdir opt/web
WORKDIR /opt/web
COPY package.json ./
RUN yarn

ENV PATH="./node_modules/.bin:$PATH"

# Following is needed for dev
ENTRYPOINT [ "yarn", "start:docker" ]

# Following is needed only for production
# RUN yarn build

# COPY ./env-config.js /opt/web/build/env-config.js

# FROM nginx:1.17-alpine
# COPY ./default.conf /etc/nginx/conf.d/
# COPY --from=builder /opt/web/build /usr/share/nginx/html
# WORKDIR /usr/share/nginx/html
# CMD ["nginx", "-g", "daemon off;"]

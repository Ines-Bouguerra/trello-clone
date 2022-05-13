# Dockerfile
FROM node:14

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

RUN ls -la

# WORKDIR /app

# copy the app, note .dockerignore
COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "yarn", "run", "dev" ]

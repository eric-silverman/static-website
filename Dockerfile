FROM node:12.16.2

# Create directories all the way up to app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/
RUN yarn install

# Bundle app source
COPY . /usr/src/app

# set environment variables
ENV SITE_HOST=http://localhost:3000/ 

# build
RUN yarn build
EXPOSE 3000

CMD [ "yarn", "start" ]
  
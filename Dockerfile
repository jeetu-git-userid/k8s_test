FROM node:7
WORKDIR /usr/src/app
COPY http-example-main.js /usr/src/app
CMD node http-example-main.js
EXPOSE 8081

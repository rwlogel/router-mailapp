FROM node:7.10.0

RUN mkdir /proj
WORKDIR /proj
ADD package.json /proj/

RUN npm install

USER node

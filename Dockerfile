FROM node:alpine

WORKDIR /app1

COPY ./package.json /app1

RUN npm install

COPY . /app1

CMD ["npm","start"]

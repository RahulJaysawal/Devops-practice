FROM node:alpine as Rahul

WORKDIR /app

COPY ./package.json /app

RUN npm install

COPY . /app

# CMD ["npm","start"]
RUN npm run build



FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=Rahul /app/build .

ENTRYPOINT [ "nginx","-g","daemon off;" ]
FROM node 

WORKDIR /app

COPY  package.json .

RUN npm install

COPY . .

EXPOSE 80

ENV MONGODB_USERNAME=test

ENV MONGODB_PASSWORD=test

CMD ["npm","start"]


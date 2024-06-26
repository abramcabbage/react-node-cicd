FROM node:slim

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY ["package.json", "package-lock.json*", "./"]
 
RUN npm install

USER node

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]

FROM node:16.10.0

WORKDIR .

RUN yarn install

COPY ./ .

CMD ["yarn", "run", "serve"]
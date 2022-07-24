FROM node:14.14.0

WORKDIR .

RUN yarn install

COPY ./ .

CMD ["yarn", "run", "serve"]
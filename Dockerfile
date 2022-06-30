# ESTAGIO 01 - Responsavel por gerar o build da aplicação
FROM node:latest as angular
WORKDIR /app
COPY . .
RUN npm i npm@latest -g
RUN npm install --silent
RUN npm run build

# ESTAGIO 02 - Responsavel por expor aplicação
FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=angular app/dist/docker-project /usr/share/nginx/html
COPY ./nginx/nginx.conf  /etc/nginx/conf.d/default.conf

# ESTAGIO 03 - Subir
# CMD ["npm","run","start"]

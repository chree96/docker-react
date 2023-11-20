# FROM node:alpine as builder
# Specify a base image
FROM node:14-alpine as builder

# Specify the folder where to execute successive commands
WORKDIR /usr/app
# WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# significa che il container è mappato alla porta specificata
EXPOSE 80
COPY --from=builder /usr/app/build usr/share/nginx/html
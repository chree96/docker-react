FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

FROM nginx
# significa che il container è mappato alla porta specificata
EXPOSE 80
COPY --from=builder /app/build usr/share/nginx/html
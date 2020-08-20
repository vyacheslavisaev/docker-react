FROM node:alpine as builder

WORKDIR /usr/app_src/

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /usr/app_src/build /usr/share/nginx/html

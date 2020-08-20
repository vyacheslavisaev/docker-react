#Build container
FROM node:alpine

WORKDIR /usr/app_src/

COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Deploy container
FROM nginx:alpine
EXPOSE 80
COPY --from=0 /usr/app_src/build /usr/share/nginx/html

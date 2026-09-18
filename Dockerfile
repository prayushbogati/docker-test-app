FROM node:26-alpine3.23 AS builder
# builder is a phase that builds app for prod.
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
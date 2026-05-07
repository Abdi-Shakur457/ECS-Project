
# stage 1 : Build stage 
FROM node:18-alpine AS builder
WORKDIR /app
COPY ./app/package.json ./app/yarn.lock ./
RUN yarn install 
COPY ./app /app
RUN yarn build 


# Stage 2 : Run stage
FROM node:18-alpine 
WORKDIR /app 

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/build /app/build
RUN yarn global add serve
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
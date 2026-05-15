# Stage 1: Build
FROM node:24-alpine AS builder

WORKDIR /app

COPY ./app/package.json ./app/yarn.lock ./
RUN yarn install --frozen-lockfile

COPY ./app .

RUN yarn build


# Stage 2: Production
FROM node:24-alpine

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# install serve properly (not via yarn global)
RUN npm install -g serve

# copy build only (clean + safe)
COPY --from=builder /app/build ./build

USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]
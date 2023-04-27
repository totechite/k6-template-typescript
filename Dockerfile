FROM node:20-bullseye-slim

# Node16以降の対応
ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /app

RUN --mount=type=cache,target=/var/lib/apt/lists \
    --mount=type=cache,target=/var/cache/apt/archives \
    apt-get update && \
    apt-get install -y python3 build-essential

COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm install

COPY . .

CMD npm start

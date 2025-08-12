FROM node:19-alpine AS base
WORKDIR /myapp
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8081

FROM base AS final
RUN npm install --production
COPY . .
CMD ["node", "index.js"]

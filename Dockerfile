# Use Node 18 official image
FROM node:18-alpine

WORKDIR /usr/src/app

# Copy package.json first (caching)
COPY package*.json ./

RUN npm install --production

# Copy source code
COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
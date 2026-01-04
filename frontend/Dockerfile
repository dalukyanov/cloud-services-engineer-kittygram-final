FROM node:18
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

RUN mkdir -p /app/static && cp -r /app/build/. /app/static/

RUN if [ -d /app/static/static ]; then \
      mv /app/static/static/* /app/static/ && rmdir /app/static/static; \
    fi

EXPOSE 8000
CMD ["npx", "-y", "http-server", "-p", "8000", "/app/build"]
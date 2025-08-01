FROM node:23-alpine AS build
WORKDIR /app

COPY ./package.json .
RUN --mount=type=cache,target=/root/.npm npm install

# Copy the application code and shared types
COPY . .

# Build
RUN npm run build

# Prod server
FROM node:23-alpine AS prod
WORKDIR /app
COPY --from=build /app/build build/
COPY --from=build /app/node_modules node_modules/
COPY --from=build /app/package.json .
EXPOSE 4173
ENV NODE_ENV=production
CMD [ "node", "build/index.js" ]

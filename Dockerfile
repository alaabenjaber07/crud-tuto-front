# Étape de build
FROM node:14 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Étape de production
FROM nginx:alpine
COPY --from=build /app/dist/your-angular-app /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]

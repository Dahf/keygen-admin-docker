# Verwende ein Node.js-Image
FROM node:18

# Arbeitsverzeichnis im Container setzen
WORKDIR /usr/src/app

# Kopiere package.json und package-lock.json
COPY package*.json ./

# Installiere Abhängigkeiten
RUN npm install

# Installiere PM2 global
RUN npm install -g pm2

# Kopiere den restlichen Code ins Arbeitsverzeichnis
COPY . .

# Baue Tailwind CSS für die Produktion
RUN npm run build:css

# Exponiere den Port, den die App verwendet
EXPOSE 3010

# Starte den Server mit PM2 im Cluster-Modus
CMD ["npm", "run", "dev"]
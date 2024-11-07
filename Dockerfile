# Verwende ein Node.js-Image
FROM node:18

# Installiere PM2 global
RUN npm install -g pm2

# Arbeitsverzeichnis im Container setzen
WORKDIR /app

# Kopiere package.json und package-lock.json
COPY package*.json ./

# Installiere Abhängigkeiten
RUN npm install

# Kopiere den restlichen Code ins Arbeitsverzeichnis
COPY . .

# Baue Tailwind CSS für die Produktion
RUN npm run build:css

# Exponiere den Port, den die App verwendet
EXPOSE 3010

# Starte den Server mit PM2 im Cluster-Modus
CMD ["pm2-runtime", "src/index.js", "--name", "keygen-admin", "--watch"]

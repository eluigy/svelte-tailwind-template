# Usa una imagen base de Node.js
FROM node:20-alpine AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración y de dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm ci

# Copia el resto del código de la aplicación
COPY . .

# Construye la aplicación
RUN npm run build

# Etapa final: usa una imagen más ligera para el entorno de producción
FROM node:20-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos necesarios desde la etapa de construcción
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .

# Expone el puerto en el que correrá la aplicación
EXPOSE 3000

# Establece la variable de entorno para producción
ENV NODE_ENV=production

# Comando para ejecutar la aplicación
CMD ["node", "build"]

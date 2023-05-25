# Menggunakan base image Node.js versi 14 Alpine
FROM node:14-alpine

# Menentukan working directory app
WORKDIR /app

# Menyalin seluruh source code kedalam directory app
COPY . ./

# Menentukan environment variables
ENV NODE_ENV=production 
ENV DB_HOST=item-db

# Menginstal dependencies dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port yang digunakan oleh aplikasi
EXPOSE 8080

# Menjalankan server saat container diluncurkan
CMD ["npm", "start"]

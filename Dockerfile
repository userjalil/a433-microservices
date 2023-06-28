# Menggunakan base image node versi 18 dengan Alpine Linux
FROM node:18-alpine

# Mengatur direktori kerja
WORKDIR /src

# Menyalin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Menginstall bash
RUN apk add --no-cache bash

# Melakukan download script wait-for-it.sh 
# Script wait-for-it.sh ini digunakan untuk memastikan agar RabbitMQ server berjalan terlebih dahulu
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Memberikan izin eksekusi pada script wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Menginstall dependensi Node.js
RUN npm install

# Menyalin file JavaScript aplikasi
COPY ./*.js ./

# Menjalankan aplikasi saat container dijalankan
CMD ["node", "index.js"]

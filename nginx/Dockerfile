# Используем официальный образ Nginx
FROM nginx:latest

# Копируем файлы конфигурации и сертификаты в контейнер
COPY nginx.conf /etc/nginx/nginx.conf
# COPY certificate.crt /etc/nginx/ssl/certificate.crt
# COPY certificate.key /etc/nginx/ssl/certificate.key
# COPY dhparams.pem /etc/nginx/ssl/dhparams.pem
COPY blacklist.conf /etc/nginx/conf.d/blacklist.conf

# Копируем директорию web в контейнер
COPY web /usr/share/nginx/html

# Открываем порт 443 для HTTPS
EXPOSE 443
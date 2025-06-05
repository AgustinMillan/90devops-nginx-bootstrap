FROM nginx:alpine

# Borra contenido viejo de html
RUN rm -rf /usr/share/nginx/html/*

# Copia tu configuración de nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Copia tu sitio
COPY site/ /usr/share/nginx/html/

FROM nginx:1.28

COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/index.html

# COPY nginx.crt /etc/ssl/
# COPY nginx.key /etc/ssl
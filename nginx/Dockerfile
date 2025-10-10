FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/

# Create directories for SSL certificates and assets
RUN mkdir -p /etc/nginx/ssl /app/public/assets

# Create self-signed certificate for initial setup
# In production, replace with real certificates from Let's Encrypt
RUN apk add --no-cache openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/key.pem \
    -out /etc/nginx/ssl/cert.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" && \
    apk del openssl

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

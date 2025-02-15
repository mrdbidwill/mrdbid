# Stage 1: Build stage
FROM composer:2.6 AS builder

WORKDIR /app

# Copy Laravel code into the image
COPY . .

# Install Composer dependencies
RUN composer install --no-dev --optimize-autoloader

# Stage 2: Production stage
FROM php:8.2-fpm

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    libzip-dev \
    pkg-config \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql mbstring exif pcntl bcmath zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# Copy the application files
COPY --from=builder /app /var/www/html/

# Set write permissions for Laravel storage and cache
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 80

CMD ["php-fpm"]

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

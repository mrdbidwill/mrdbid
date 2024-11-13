#!/bin/bash

# Navigate to project directory
cd /var/www/public_html/mrdbid || exit

# Install the required PHP extensions
sudo apt-get install -y php8.3-xml

# Pull latest changes from GitHub repository
git pull origin main

# Install/Update Composer dependencies as will_user
sudo -u will_user composer update --optimize-autoloader --no-dev
sudo -u will_user composer install --optimize-autoloader --no-dev

# Run database migrations
php artisan migrate --force

# Clear previous configurations and cache
php artisan route:clear
php artisan config:clear
php artisan cache:clear

# Optimize Laravel
php artisan optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Restart Apache
sudo service apache2 restart

echo "Deployment completed successfully!"

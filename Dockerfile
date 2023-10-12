FROM php:8.1

RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Define the startup command
CMD [ "sh", "-c", "php artisan serve --host=0.0.0.0 --port=8000 & php artisan migrate && tail -f /dev/null" ]

FROM php:7.4-fpm

ARG APP_ENV=local

RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    default-mysql-client \
    && docker-php-ext-install \
        pdo_mysql \
        mysqli \
        mbstring \
        exif \
        bcmath \
        gd \
        zip \
        opcache \
    && docker-php-ext-enable opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY composer.json composer.lock ./

RUN composer install \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader \
    --no-dev

COPY . .

RUN chown -R www-data:www-data /var/www

COPY docker/php/php-${APP_ENV}.ini /usr/local/etc/php/php.ini
COPY docker/php/conf.d/opcache-${APP_ENV}.ini \
     /usr/local/etc/php/conf.d/opcache.ini

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER www-data

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm","-F"]

FROM php:7.2-fpm-alpine

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && composer global require hirak/prestissimo --no-plugins --no-scripts

# install npm packages
RUN apk add npm libxml2 libxml2-dev
RUN npm install -g yarn

# install dependencies
RUN docker-php-ext-install pdo pdo_mysql

# install extra Laravel dependencies
RUN docker-php-ext-install bcmath tokenizer xml
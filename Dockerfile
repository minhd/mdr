FROM php:7.2-fpm-alpine

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && composer global require hirak/prestissimo --no-plugins --no-scripts

# install dependencies
RUN docker-php-ext-install pdo pdo_mysql

# install extra Laravel dependencies
RUN docker-php-ext-install bcmath openssl tokenizer xml

# install npm packages
RUN apk add npm
RUN npm install -g yarn
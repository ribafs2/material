# Dicas sobre o Composer

É um gerenciador de dependências para PHP, com bons recursos para instalar, atualizar e gerenciar módulos em PHP. Ele checa quais as dependências de um pacote e as instala, usando as versões indicadas.

## Site oficial 
https://getcomposer.org

## Documentação
https://getcomposer.org/doc/

## Para Windows
https://getcomposer.org/doc/00-intro.md#using-the-installer

## Para Linux
sudo apt install composer

## Atualizar para a versão 2

https://getcomposer.org/download/

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/bin/composer

composer --version

## Instalar dependências mas não as em desenvolvimento
composer install --no-dev

## Retornar informações sobre pacote instalado
composer show ribafs/crud-generator-ac

## Versão
composer --version

## O Packagist.org é o principal repositório de pacotes para o Composer - https://packagist.org/

## Pesquisar por pacotes cadastrados no repositório
composer search nome_pacote

## Após cada alteração no composer.json executar
composer dumpautoload

## Instalando um pacote em um projeto

cd projeto
composer require ribafs/mini-mvc

## Atualização de pacote instalado para uma nova versão lançada
composer require ribafs/mini-mvc

Ele cria a pasta vendor no diretório atual com as dependências dentro e toma outras providências.

## Ajuda
composer help require

## Instalar dependeências

Para instalar as dependências existentes no composer.json

composer install

## Atualizar dependências

Para atualizar dependências que existam desatualizadas no composer.json

composer update

Após a criação de um composer.json sem dependências, apenas com psr-4
composer dump-autoload

composer dump-autoload --optimize

Criar um composer.json interativamente
composer init

Quando baixamos um aplicativo que vem sem a pasta vendor e tem dependências
composer install

Instalar um pacote no aplicativo atual
composer require ribafs/laravel-acl

Remover um pacotes instalado
composer remove ribafs/admin-br

Listar todos os pacotes disponíveis
composer show

composer config --list



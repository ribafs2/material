# Dicas sobre o uso do Composer

## Instalar dependeências

Para instalar as dependências existentes no composer.json

composer install

## Atualizar dependências

Para atualizar dependências que existam desatualizadas no composer.json

composer update

## Nunca use em produção

composer update

É lento e criará problemas com as dependências

Ao invés use

composer update no desktop e envie o composer.lock para o servidor

Então execute

composer install no servidor

## Instalar dependências/pacotes

composer require vendor_name/pacote

## Desinstalar pacote

composer remove vendor_name/pacote

Instalar novamente o mesmo pacote removerá o existente e procurará por nova versão, caso não exista, reinstalará a mesma


Executar scripts com composer.json
```php
    "scripts": {
        "post-root-package-install": [
            "php -r \"copy('.env.example', '.env');\""
        ],
        "post-create-project-cmd": [
            "php artisan key:generate"
        ],
        "post-install-cmd": [
            "Illuminate\\Foundation\\ComposerScripts::postInstall",
            "php artisan optimize"
        ],
        "post-update-cmd": [
            "Illuminate\\Foundation\\ComposerScripts::postUpdate",
            "php artisan optimize"
        ]
    },

    "scripts": {
        "post-autoload-dump": [
            "Illuminate\\Foundation\\ComposerScripts::postAutoloadDump",
            "@php artisan package:discover --ansi"
        ],
        "post-root-package-install": [
            "@php -r \"file_exists('.env') || copy('.env.example', '.env');\""
        ],
        "post-create-project-cmd": [
            "@php artisan key:generate --ansi"
        ]
    }
```


## 4.2 - Introdução ao NodeJS

Apenas revendo os comandos necessários para usar o NPM no Laravel e mais alguns e a instalação do node.

Atualmente o NodeJS é bem popular. Especialmente por conta do seu gerenciador de pacotes, o NPM, que entrega muitos pacotes úteis.
O laravel o utiliza para criar seus Assets, durante a instalação.

### Site oficial

https://nodejs.org/en/

### Instalação

Windows - https://nodejs.org/dist/v14.15.1/node-v14.15.1-x86.msi

Linux Mint 20

Node.js v14.x:

### Para quem usa Ubuntu, Linux Mint e outras

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

### Usando o NPM

#### Na instalação do laravel

Após instalar o laravel devemos executar o NPM para instalar os assets com
```css
npm install
npm run dev
npm audit fix
```
NPM - Node Package Manager

### Versão do node

node -v

### Versão do npm

npm -v

### Atualizar o node

npm update -g npm

### Criar um pacote

npm init

### Instalar módulos

npm install nome

npm i nome

### Referência

https://www.w3schools.com/nodejs/default.asp



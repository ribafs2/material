# web-share

Pequeno ambiente para compartilhar seu servidor web através do Ngrok.
Para executar o fileman e o unzziper precisará copiar para seu diretório web com suporte ao PHP

Uma boa providência para reforçar a segurança é ativar o firewall, filtrando apenas a porta que liberou no Ngrok.

Caso use Ubuntu ou derivada habilite o ufw e adicione a regra abaixo para liberar a porta 8000 (default para laravel) somente para um amigo cujo IP está declarado abaixo:

ufw allow from IPdoAmigo to any port 8000

## Como funciona?

Apenas siga as instruções aqui contidas, envia o link para um amigo e ele além de ver sua web, também conta com um excelente gerenciador de arquivos para poder editar seus arquivos remotamente, copiar, excluir, etc. Então somente deve fazer isso com quem você confia. Mas como "seguro morreu de velho", sempre faça backup de toda a sua pasta web.

## Compartilhando sites ou aplicativos com amigos ou clientes

Você cria o site ou aplicativo e envia o link para seu amigo ou cliente. Se for um amigo ele poderá ver e ajudar você a resolver um problema de forma mais eficiente do que você apenas descrevendo o que está acontecendo. Se for um cliente você cria e envia o link, e somente entrega quando ele aprovar e te pagar antes, claro. É prudente evitar enviar para o servidor dele antes do pagamento.

## Compartilhando arquivos com amigos ou clientes.

Supondo que você trabalha com edição de vídeos e quando termina um vídeo envia para o OneDrive, Google Drive ou similar. Quando você envia está fazendo um upload e isso é mais lento que o download 10 vezes. Como vídeos podem ser arquivos grandes e dependendo da velocidade da sua internet e da velocidade do servidor, poderá demorar muito. Então reduza isso deixando seu cliente fazer download ao invés de você fazer upload e depois ele fazer download. Para isso use o Ngrok que compartilha seu servidor web e crie uma pasta para que seu cliente acesse diretamente de seu computador.

Sugestão de algo que considero ideal:
- Crie uma pasta c:\xampp\htdocs\download
- Joque os vídeos para dentro dessa pasta
- Inicie o ngrok

Sugestão: prefira sempre enviar o link https gerado, pois é mais seguro.

Supondo que ele gerou o link

http://dcfac27e001e.ngrok.io

Então envie o seguinte link para o cliente

http://dcfac27e001e.ngrok.io/download

Assim todos os vídeos da pasta downloads poderão ser vistos e baixados por ele. Quando ele clicar em um vídeo ele será aberto no navegador. Após ele carregar basta teclar Ctrl+S para salvar.

## Ngrok - Compartilhando seu servidor web

Para compartilhar sua web com amigos o Ngrok é uma ótima opção, inclusive com plano gratuito.

Download disponível para Mac, Windows, Linux e FreeBSD
https://ngrok.com/download

Faça o download e descompacte.

Registre-se no https://ngrok.com/

E faça login

Então copie o comando existente em Connect your account como este abaixo

ngrok authtoken 1knuoDEhArifFTpa3Wlz3RN3iAY_3UYBKmpzn2dqTUVKGea

Cole no prompt/terminal para executar

./ngrok authtoken 1knuoDEhArifFTpa3Wlz3RN3iAY_3UYBKmpzn2dqTUVKGea

./ngrok http 80

No Windows não use o ./ inicial

## FileManager

Mais detalhes sobre o tinyfilemanager pode ser encontrado aqui

https://github.com/ribafs/tinyfilemanager

## Unzipper

https://github.com/ribafs/unzipper

## Generic Backup

https://github.com/ribafs/generic-backup

## Créditos

- Ngrok - https://ngrok.com/

- tinyfilemanager - https://github.com/prasathmani/tinyfilemanager

- Unzipper - https://github.com/ndeet/unzipper

- template - https://startbootstrap.com/theme/grayscale

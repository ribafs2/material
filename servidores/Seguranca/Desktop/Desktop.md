# Melhorar a segurança no Desktop

Melhorar a segurança no desktop é importane para maior segurança do servidor, pois estamos interagindo frequentemente com ele do nosso desktop e poderemos comprometẽ-lo.

Hábitos saudáveis como usar um sistema operacional menos inseguro e atualizado, como usando um firewall ativo e fechando tudo que pode.

Assim como também instalando boas ferramentas de monitoramento do servidor no desktop.

## Instalar no micro desktop linux o W3AF

apt-get install w3af

Traz uma interface para a console e uma gráfica/web

## Testando vulnerabilidades web com Nikto

O Nikto é web server scanner escrito em perl usado para detectar vulnerabilidades em servidores web. Ele é muito simples de ser usado e atualizado gerando relatórios em txt, html e csv.

apt-get install nikto

### Atualizando os plugins:

nikto -update

### Usando o Nikto
```bash
nikto -h HOST -p PORT
nikto -h HOST -p PORT -ssl
nikto -h ribafs.org
nikto -C all -host 200.128.X.X -o vitima.txt (mude X.X pelos números desejados)

- C all - Força a checagem de todos os diretórios em busca de cgi
- host - Ip da vitima
-o - Gera um arquivo de relatório
```
### Varrendo uma porta de um host:

nikto -h google.com -p 443

### Help

nikto -H | less

Esta ferramenta tanto ajuda a defender o seu site quanto ajuda para quem quer perceber vulnerabilidades em outros sites ou atacar.

### Documentação oficial:

http://cirt.net/nikto2-docs/ 

### Exemplos de uso:

http://cirt.net/nikto2-docs/usage.html




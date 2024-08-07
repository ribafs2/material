-- Modelagem de banco para uma Locadora de V�deos simples
-- banco: locadora com encoding latin1

-- esta tabela tamb�m precisa de uma boa normaliza��o, separando pelo menos os campos tipo, munic�pio e uf
-- mas como j� tenho um script contendo os registros ficaremos assim, pelo menos por enquanto
create table cep_brasil (
	cep char(8) primary key, 
	tipo char(72), 
	logradouro char(70),
	bairro char(72),
	municipio char(60), 
	uf char(2)
);
-- script com registros do CEP encontra-se em: http://pg.ribafs.net/down/scripts//cep.sql.zip

create table empresas
(
	empresa int primary key,
	cnpj varchar(14) not null,  -- como cnpj n�o � �nico em algumas situa��es, n�o pode ser pk (ex.: �rg�os p�blicos)
	razao_social varchar(45) not null,
	cep varchar(8) not null,
	site varchar(50),
	email varchar(40),
	constraint cep_fk foreign key (cep) references cep_brasil (cep)
);

create table funcionarios
(
	funcionario int primary key, --- cpf
	nome varchar(45) not null,
	rg varchar(30) not null,
	data_admissao date not null,
	cep varchar(8) not null,
	telefone varchar(15),
	celular varchar(15),
	foto varchar(50) not null,
	administrador boolean not null,		-- para controlar o acesso � algumas se��es
	empresa int not null,
	constraint empresa_fk foreign key (empresa) references empresas (empresa),
	constraint cep_fk foreign key (cep) references cep_brasil (cep)
);

create table clientes
(
	cliente int primary key, -- cpf
	nome varchar(45) not null,
	rg varchar(30) not null,
	foto varchar(50), -- para carteira de s�cio
	data_cadastro date not null,
	taxa_inscricao numeric(12,2) not null,
	cep varchar(8) not null,
	telefone varchar(15),
	email varchar(50),
	referencias text not null,
	receber_novidades_email boolean default true not null,
	liberado boolean default TRUE not null, -- boolean -liberado para alugar ou n�o (bloqueado)
	aprovado_por int not null, -- funcion�rio que aprovou
	constraint cep_fk foreign key (cep) references cep_brasil (cep),
	constraint aprovado_fk foreign key (aprovado_por) references funcionarios (funcionario)
);

create table dependentes
(
	dependente int primary key,
	nome varchar(45) not null,
	cliente int not null,
	foto varchar(50), -- para carteira de s�cio
	data_cadastro date not null,
	constraint cliente_fk foreign key (cliente) references clientes (cliente)
);

create table fornecedores
(
	fornecedor int primary key,
	razao_social varchar(59) not null,
	cpf varchar(11),
	cnpj varchar(14),
	inscricao_estadual varchar(30),
	cep varchar(8) not null,
	telefone varchar(15) not null,
	site varchar(50),
	contato varchar(45) not null,
	contato_fone varchar(15),
	fax varchar(15),
	observacao text,
	constraint cep_fk foreign key (cep) references cep_brasil (cep)
);

create table generos
(
	genero int primary key,
	descricao varchar(50) -- rom�ntico, �pico, a��o, educativos, infantil, fic��o cient�fica, document�rio, ...
);

create table distribuidoras
(
	distribuidora int primary key,
	nome varchar(45) not null
);

create table filmes
(
	filme int primary key,
	diretor varchar(45) not null, -- poderia ter um cadastro
	duracao varchar(30) not null,
	sinopse text not null,
	foto_cena varchar(50), -- cena principal do filme
	ano varchar(4) not null,
	ator_principal varchar(45) not null, -- poderia ter um cadastro
	ator_coadjuvante varchar(45) not null, -- poderia ter um cadastro
	genero int not null,
	distribuidora int not null,
	titulo varchar(45) not null,
	constraint genero_fk foreign key (genero) references generos (genero),
	constraint distribuidora_fk foreign key (distribuidora) references distribuidoras (distribuidora)
);

create table compras
(
	compra int primary key,
	data date not null,
	fornecedor int not null,
	constraint fornecedor_fk foreign key (fornecedor) references fornecedores(fornecedor)	
);

create table compra_itens -- alimentada com dados de produtos quando cadastrando os pedidos. � a compra dos produtos
(
	item int primary key,
	compra int not null,
	filme int not null,
	quantidade int not null, -- Ser� somado ao estoque existente
	preco_unitario numeric(12,2), -- Pre�o de compra
	estoque_min int not null,
	constraint filme_fk foreign key (filme) references filmes(filme),
	constraint compra_fk foreign key (compra) references compras(compra)
);

-- Seria correspondente ao estoque no controle de estoque
create table fitas	-- nome mantido pela tradi��o, mas de fato s�o CDs e DVDs
(
	fita int primary key,
	fornecedor int not null,
	tipo char(3) not null check (tipo='CD' or tipo='DVD' or tipo='VHS'),
	filme int not null,
	cotacao char(1)  not null check (cotacao='A' or cotacao='B' or cotacao='C'),  
	custo_aquisicao numeric(12,2) not null,
	data_aquisicao date not null,
	quantidade_copias int not null, -- somar quando receber e subtrair quando alugar
	dub_leg varchar(9) not null check (dub_leg='dublado' or dub_leg='legendado'), -- dublado ou legendado
	lancamento boolean default FALSE not null,
	observacao text,
	constraint filme_fk foreign key (filme) references filmes (filme)
);

-- Seria correspondente ao pedido no controle de estoque
create table locacoes
(
	locacao int primary key,
	fita int not null,
	cliente int not null,
	data_locacao date not null,
	data_devolucao date not null,
	cheque varchar(15) not null, --numero do cheque
	forma_pagamento int not null,
	multa_atrazo numeric(12,2),
	valor_total numeric(12,2) not null,
	constraint cliente_fk foreign key (cliente) references clientes (cliente),
	constraint fita_fk foreign key (fita) references fitas (fita)
);

/*

Sugest�es de Relat�rios:
Relatorios dos melhores clientes; -- que mais alugaram
Relat�rio filmes mais locados;
Relat�rio mais lucrativos;
Relat�rio filmes em atraso;
Relatorio de clientes que mais locaram no mes;
Relatorio de clientes que mais locaram por periodo;
Relatorio de clientes cadastrados no mes;
Relatorio de filmes cadastrados no mes;
Relatorio de filmes adquiridos no mes com valor;
Relatorio de filmes ausentes da locadora;
Relat�rio de filmes tipo lan�amento;
Relat�rio de Loca��es de Devolu��es
Relat�rio de Loca��es de Devolu��es por Per�odo
Relat�rio de Aniversariantes
Gr�ficos de alguns relat�rios-

Sugest�es:
- Este sistema pode ser ampliado com v�rios outros recursos, como:
cadastro de cheques, cadastro de tipos de pagamentos entre outros
- Implementar sistema de autentica��o tendo como base a tabela de funcion�rios e controlando
quem tem acesso a que �reas do sistema. Exemplo: o atendente n�o teria acesso ao estoque (fitas), 
somente os usu�rios administradores.
- Rotina para backup autom�tico (cron ou agendador de tarefas ou ainda o pgagent) e restaura��o.
- Computador para consulta de filmes pelos clientes.
- Site contendo imagens dos filmes para alugu�l via telefone ou e-mail.
Aqui ter� pelo menos os filmes existentes, endere�o, telefone e e-mail de contato que consulte 
seus e-mails com boa frequ�ncia. Outras informa��es consideradas �teis.
Como tamb�m poder� oferrecer uma loja completa pela internet.
- Validar CPF e CNPJ com fun��o em plpgsql.

Adapta��o de esquema encontrado em:
http://bechelli.org/files/access/videolocadora_2005.pdf
Dos professores Carlos, Vivian e Rodrigo
------------------------------------------------
Colabora��o de Ribamar FS - http://pg.ribafs.org
*/

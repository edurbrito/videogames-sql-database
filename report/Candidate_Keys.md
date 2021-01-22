O cálculo das Chaves Candidatas e estabelecimento de uma Chave Primária para cada relação, considerando apenas as dependências funcionais não triviais presentes no modelo relacional, efetuou-se da seguinte forma:

* Marca: 
  * $\{id\}⁺ = \{ id, nome \}$
  * $\{nome\}⁺ = \{ id, nome \}$
$id$ é a chave primária.
<br>

* Produto:
  * $\{sku\}⁺ = \{ sku, nome, precoBase, stock, marca, idDesconto \}$
  * $\{nome, marca \}⁺ = \{ sku, nome, precoBase, stock, marca, idDesconto \}$
$sku$ é a chave primária.
<br>

* Acessorio:
  * $\{ sku \}⁺ = \{ cor, conexao, tamanho, versao \}$
$sku$ é a chave primária.
Semelhante para as relações Consola, Videojogo e Merchandising.
<br>

* AcompativelComC:
  * $\{skuA, skuC\}⁺ = \{skuA, skuC \}$
$\{skuA, skuC\}$ é a chave primária.
Semelhante para as relações VcompativelComC, BcontemP, Avaliacao, Conquistou, CompraDoBundle, CompraDoProduto
<br>

* Bundle:
  * $\{id\}⁺ = \{nome, preco, descricao\}$
$id$ é a chave primária.
<br>

>Adicionar email FD semelhante a username
* Cliente:
  * $\{ id \}⁺ = \{ id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto\}$
  * $\{ username \}⁺ = \{ id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto\}$
  * $\{ email \}⁺ = \{ id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto\}$
$id$ é a chave primária.
<br>

* Localizacao:
  * $\{id\}⁺ = \{id, nome\}$
  * $\{nome\}⁺ = \{id, nome\}$
$id$ é a chave primária.
<br>

* Estatuto:
  * $\{id\}⁺ = \{id, titulo, pontosMinimo, pontosMaximo\}$
  * $\{titulo\}⁺ = \{id, titulo, pontosMinimo, pontosMaximo\}$
$id$ é a chave primária.
<br>

* Conquista:
  * $\{id\}⁺ = \{id, pontos, descricao\}$
$id$ é a chave primária.
Semelhante para as relações Fidelizacao, NivelPontos, NumeroCompras.
<br>

* Compra:
  * $\{id\}⁺ = \{id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos\}$
  * $\{idCliente, dataHora\}⁺ = \{id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos\}$
$id$ é a chave primária.
<br>

> Nota: Nas seguintes adicionar as FDs em falta, por exemplo, 
> $percentagem, dataInicio, dataFim \rightarrow id$

* DescontoEspecial:
  * $\{id\}⁺ = \{id, percentagem, descrição, dataInicio, dataFim\}$
  * $\{percentagem, dataInicio, dataFim\}⁺ = \{id, percentagem, descrição, dataInicio, dataFim\}$
  $id$ é a chave primária.
  Semelhante para as relações DescontoSazonal e DescontoPorPontos.

>----

Efetuado o cálculo das chaves candidatas de cada relação, averiguámos possíveis violações às formas normais e constatámos que, em todas as dependências funcionais não triviais, o lado esquerdo é uma chave, sendo condição suficiente para obedecer tanto à Forma Normal Boyce-Codd, como à 3a Forma Normal, menos restritiva que a primeira.
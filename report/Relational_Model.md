# Relational Model

## Notes

<strike>
É necessário discutir e definir o melhor estilo para a generalização associada ao Produto, porque vai influenciar as relações seguintes.

Decisão parcial entre E/R style e Object Oriented sinalizada a verde (aceite) ou vermelho (não aceite) -  ver HTML.

FDs estabelecidas: Existem algumas violações à BCNF, no entanto, não foi detetada nenhuma violação à 3NF. 

> No UML: Adicionar sku ao Bundle

Rever E/R Style. Ver se é necessária uma relação auxiliar para guardar os tipos de Produtos ( ex : A, C, V, M) e os tipos de Conquistas (ex: F, P, C).
</strike>

<img src='https://image.flaticon.com/icons/svg/752/752755.svg' style="width: 50px; padding: 10px;"> 

**Pendente de revisão Geral.**

## Schema 

Marca(<u>id</u>, nome)

        id -> nome
        nome -> id  // BCNF Violation, nome UNIQUE

<hr style="border-top: 1px dashed grey;">

> <span style="background-color: green; color: white; padding: 5px;">E/R style:

Produto(<u>sku</u>, nome, tipo$\rightarrow$TipoProduto, precoBase, stock, marca$\rightarrow$Marca, idDesconto$\rightarrow$DescontoEspecial)

        sku -> all
        (nome, marca) -> sku  // BCNF Violation, (nome, marca) UNIQUE

TipoProduto(<u>tipo</u>)

Acessorio(<u>sku</u>$\rightarrow$Produto, cor, conexao, tamanho, versao)

        sku -> all

Consola(<u>sku</u>$\rightarrow$Produto, cor, cpu, grafica, armazenamento, versao)

        sku -> all

Videojogo(<u>sku</u>$\rightarrow$Produto, idadeMinima, rating, dataLancamento)

        sku -> all

Merchandising(<u>sku</u>$\rightarrow$Produto, variante)

        sku -> variante

> <span style="background-color: red; color: white; padding: 5px;">Object Oriented Style:</span>

Acessorio(<u>sku</u>, nome, precoBase, stock, marca$\rightarrow$Marca, cor, conexao, tamanho, versao, idDesconto$\rightarrow$DescontoEspecial)

Consola(<u>sku</u>, nome, precoBase, stock, marca$\rightarrow$Marca, cor, cpu, grafica, armazenamento, versao, idDesconto$\rightarrow$DescontoEspecial)

Videojogo(<u>sku</u>, nome, precoBase, stock, marca$\rightarrow$Marca, idadeMinima, rating, dataLancamento, idDesconto$\rightarrow$DescontoEspecial)

Merchandising(<u>sku</u>, nome, precoBase, stock, marca$\rightarrow$Marca, variante, idDesconto$\rightarrow$DescontoEspecial)

<hr style="border-top: 1px dashed grey;">

>Acessório Compatível Com Consola

AcompativelComC(<u>skuA</u>$\rightarrow$Acessorio, <u>skuC</u>$\rightarrow$Consola)

>Videojogo Compatível Com Consola

VcompativelComC(<u>skuV</u>$\rightarrow$Videojogo, <u>skuC</u>$\rightarrow$Consola)

<hr style="border-top: 1px dashed grey;">

Bundle(<u>id</u>, nome, preco, descricao)

        id -> all

> <span style="background-color: green; color: white; padding: 5px;">E/R style #Produto:

BcontemP(<u>idB</u>$\rightarrow$Bundle, <u>skuP</u>$\rightarrow$Produto, quantidade)

        idB, skuP -> quantidade

> <span style="background-color: red; color: white; padding: 5px;">Object Oriented style & Use NULLS #Produto:

BcontemP(<u>idB</u>$\rightarrow$Bundle, skuA$\rightarrow$Acessorio, skuC$\rightarrow$Consola, skuV$\rightarrow$Videojogo, skuM$\rightarrow$Merchandising, quantidade)

<hr style="border-top: 1px dashed grey;">

Cliente(<u>id</u>, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao$\rightarrow$Localizacao, estatuto$\rightarrow$Estatuto)

        id -> all

Avaliacao(<u>idCliente</u>$\rightarrow$Cliente, <u>skuV</u>$\rightarrow$Videojogo, valor)

        idCliente, skuV -> valor

Localizacao(<u>id</u>, nome)

        id -> nome
        nome -> id  // BCNF Violation, nome UNIQUE

Estatuto(<u>id</u>, titulo, pontosMin, pontosMax)

        id -> all
        titulo -> id  // BCNF Violation, titulo UNIQUE

<hr style="border-top: 1px dashed grey;">

> <span style="background-color: green; color: white; padding: 5px;">E/R style:

Conquista(<u>id</u>, pontos, descricao, tipo$\rightarrow$TipoConquista)

        id -> all

TipoConquista(<u>tipo</u>)

Fidelizacao(<u>id</u>$\rightarrow$Conquista, diasMin)

        id -> diasMin

NivelPontos(<u>id</u>$\rightarrow$Conquista, pontosMin)

        id -> pontosMin

NumeroCompras(<u>id</u>$\rightarrow$Conquista, comprasMin)

        id -> comprasMin

Conquistou(<u>idCliente</u>$\rightarrow$Cliente, <u>idConquista</u>$\rightarrow$Conquista)

<hr style="border-top: 1px dashed grey;">

Compra(<u>id</u>, idCliente$\rightarrow$Cliente, valor, dataHora, pontos, idSazonal$\rightarrow$DescontoSazonal, idPorPontos$\rightarrow$DescontoPorPontos)

        id -> all
        (idCliente, valor, dataHora) -> id  // BCNF Violation, (idCliente, valor, dataHora) UNIQUE
 
ComDescontoEspecial(<u>idCompra</u>$\rightarrow$Compra, <u>idEspecial</u>$\rightarrow$DescontoEspecial)


CompraDoBundle(<u>idCompra</u>$\rightarrow$Compra, <u>idBundle</u>$\rightarrow$Bundle, quantidade)

        idCompra, idBundle -> quantidade

> <span style="background-color: green; color: white; padding: 5px;">E/R style #Produto:

CompraDoProduto(<u>idCompra</u>$\rightarrow$Compra, <u>idProduto</u>$\rightarrow$Produto, quantidade)</strike>

        idCompra, idProduto -> quantidade

> <span style="background-color: red; color: white; padding: 5px;">Object Oriented style #Produto:

CompraDoProduto(<u>id</u>, idCompra$\rightarrow$Compra, skuA$\rightarrow$Acessorio, skuC$\rightarrow$Consola, skuV$\rightarrow$Videojogo, skuM$\rightarrow$Merchandising, quantidade)

<hr style="border-top: 1px dashed grey;">

> <span style="background-color: green; color: white; padding: 5px;">Object Oriented Style:

DescontoEspecial(<u>id</u>, percentagem, descricao, dataInicio, dataFim)

        id -> all

DescontoSazonal(<u>id</u>, percentagem, descricao, dataInicio, dataFim)

        id -> all

DescontoPorPontos(<u>id</u>, percentagem, descricao, pontosMin, pontosMax)

        id -> all

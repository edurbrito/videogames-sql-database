PRAGMA FOREIGN_KEYS = ON;

.mode column
.headers on
.nullvalue NULL

--------------------------------------------------

DROP TABLE IF EXISTS Marca;

CREATE TABLE Marca (
    id                  INTEGER,
    nome                VARCHAR(50) NOT NULL,

    CONSTRAINT MarcaPK PRIMARY KEY (id),
    CONSTRAINT MarcaNomeUNIQUE UNIQUE (nome)
);

DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    sku                 INTEGER,
    nome                VARCHAR(50) NOT NULL,
    precoBase           REAL NOT NULL DEFAULT 30.00,
    stock               INTEGER NOT NULL DEFAULT 1,
    marca               INTEGER NOT NULL,
    idDesconto          INTEGER,

    CONSTRAINT ProdutoPK PRIMARY KEY (sku),
    CONSTRAINT ProdutoUNIQUE UNIQUE (nome, marca),
    CONSTRAINT ProdutoPrecoBase CHECK (precoBase > 0),
    CONSTRAINT ProdutoStock CHECK (stock >= 0),
    CONSTRAINT ProdutoMarca FOREIGN KEY (marca) REFERENCES Marca ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ProdutoDesconto FOREIGN KEY (idDesconto) REFERENCES DescontoEspecial ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Acessorio;

CREATE TABLE Acessorio (
    sku                 INTEGER,
    cor                 VARCHAR(30),
    conexao             VARCHAR(30),
    tamanho             VARCHAR(30),
    versao              VARCHAR(30),

    CONSTRAINT AcessorioPK PRIMARY KEY (sku),
    CONSTRAINT AcessorioSku FOREIGN KEY (sku) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Consola;

CREATE TABLE Consola (
    sku                 INTEGER,
    cor                 VARCHAR(30),
    cpu                 VARCHAR(30),
    grafica             VARCHAR(30),
    armazenamento       VARCHAR(30),
    versao              VARCHAR(30),

    CONSTRAINT ConsolaPK PRIMARY KEY (sku),
    CONSTRAINT ConsolaSku FOREIGN KEY (sku) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Videojogo;

CREATE TABLE Videojogo (
    sku                 INTEGER,
    idadeMinima         INTEGER NOT NULL DEFAULT 3,
    rating              INTEGER,
    dataLancamento      DATE NOT NULL,

    CONSTRAINT VideojogoPK PRIMARY KEY (sku),
    CONSTRAINT VideojogoSku FOREIGN KEY (sku) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT VideojogoIdadeMinima CHECK (idadeMinima > 0),
    CONSTRAINT VideojogoRating CHECK (rating IS NULL OR (rating >= 0 AND rating <= 5)),
    CONSTRAINT VideojogoDataLancamento CHECK (dataLancamento IS strftime('%Y-%m-%d', dataLancamento))
);

DROP TABLE IF EXISTS Merchandising;

CREATE TABLE Merchandising (
    sku                 INTEGER,
    variante            VARCHAR(50),

    CONSTRAINT MerchandisingPK PRIMARY KEY (sku),
    CONSTRAINT MerchandisingSku FOREIGN KEY (sku) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS AcompativelComC;

CREATE TABLE AcompativelComC (
    skuA                INTEGER,
    skuC                INTEGER,

    CONSTRAINT AcompativelComCPK PRIMARY KEY (skuA, skuC),
    CONSTRAINT AcompativelComCSkuA FOREIGN KEY (skuA) REFERENCES Acessorio ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT AcompativelComCSkuC FOREIGN KEY (skuC) REFERENCES Consola ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS VcompativelComC;

CREATE TABLE VcompativelComC (
    skuV                INTEGER,
    skuC                INTEGER,

    CONSTRAINT VcompativelComCPK PRIMARY KEY (skuV, skuC),
    CONSTRAINT VcompativelComCSkuV FOREIGN KEY (skuV) REFERENCES Videojogo ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT VcompativelComCSkuC FOREIGN KEY (skuC) REFERENCES Consola ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Bundle;

CREATE TABLE Bundle (
    id                  INTEGER,
    nome                VARCHAR(50) NOT NULL,
    preco               REAL NOT NULL,
    descricao           VARCHAR(100),

    CONSTRAINT BundlePK PRIMARY KEY (id),
    CONSTRAINT BundlePreco CHECK (preco > 0)
);

DROP TABLE IF EXISTS BcontemP;

CREATE TABLE BcontemP (
    idB                 INTEGER,
    skuP                INTEGER,
    quantidade          INTEGER NOT NULL DEFAULT 1,
    
    CONSTRAINT BcontemPPK PRIMARY KEY (idB,skuP),
    CONSTRAINT BcontemPIdB FOREIGN KEY (idB) REFERENCES Bundle ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT BcontemPskuP FOREIGN KEY (skuP) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT BcontemPQuantidade CHECK (quantidade > 0)
);

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    id                  INTEGER, 
    username            VARCHAR(50) NOT NULL,
    nome                VARCHAR(50) NOT NULL,
    email               VARCHAR(50) NOT NULL, 
    dataNascimento      DATE NOT NULL, 
    morada              VARCHAR(100) NOT NULL, 
    codigoPostal        VARCHAR(8) NOT NULL, 
    dataCriacaoConta    DATE NOT NULL, 
    pontos              INTEGER NOT NULL DEFAULT 0, 
    localizacao         INTEGER NOT NULL,
    estatuto            INTEGER NOT NULL,

    CONSTRAINT ClientePK PRIMARY KEY (id),
    CONSTRAINT ClienteUNIQUEusername UNIQUE (username),
    CONSTRAINT ClienteUNIQUEemail UNIQUE (email),
    CONSTRAINT ClientePontos CHECK (pontos >= 0),
    CONSTRAINT ClienteLocalizacao FOREIGN KEY (localizacao) REFERENCES Localizacao ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ClienteEstatuto FOREIGN KEY (estatuto) REFERENCES Estatuto ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ClienteDataNascimento CHECK (dataNascimento IS strftime('%Y-%m-%d', dataNascimento)),
    CONSTRAINT ClienteDataCriacaoConta CHECK (dataCriacaoConta IS strftime('%Y-%m-%d', dataCriacaoConta))
);

DROP TABLE IF EXISTS Avaliacao;

CREATE TABLE Avaliacao (
    idCliente           INTEGER, 
    skuV                INTEGER, 
    valor               INTEGER NOT NULL,

    CONSTRAINT AvaliacaoPK PRIMARY KEY (idCliente, skuV),
    CONSTRAINT AvaliacaoIdCliente FOREIGN KEY (idCliente) REFERENCES Cliente ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT AvaliacaoSkuV FOREIGN KEY (skuV) REFERENCES Videojogo ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT AvaliacaoValor CHECK (valor >= 1 AND valor <= 5)
);

DROP TABLE IF EXISTS Localizacao;

CREATE TABLE Localizacao (
    id                  INTEGER,
    nome                VARCHAR(50) NOT NULL,

    CONSTRAINT LocalizacaoPK PRIMARY KEY (id),
    CONSTRAINT LocalizacaoUNIQUE UNIQUE (nome)
);

DROP TABLE IF EXISTS Estatuto;

CREATE TABLE Estatuto (
    id                  INTEGER,
    titulo              VARCHAR(20) NOT NULL, 
    pontosMinimo        INTEGER NOT NULL,
    pontosMaximo        INTEGER NOT NULL,

    CONSTRAINT EstatutoPK PRIMARY KEY (id),
    CONSTRAINT EstatutoUNIQUE UNIQUE (titulo),
    CONSTRAINT EstatutopontosMinimo CHECK (pontosMinimo >= 0),
    CONSTRAINT EstatutopontosMaximo CHECK (pontosMaximo > 0),
    CONSTRAINT EstatutoPontosMaxMaiorMin CHECK (pontosMaximo > pontosMinimo)
);

DROP TABLE IF EXISTS Conquista;

CREATE TABLE Conquista (
    id                  INTEGER,
    pontos              INTEGER NOT NULL,
    descricao           VARCHAR(50),

    CONSTRAINT ConquistaPK PRIMARY KEY (id),
    CONSTRAINT ConquistaPontos CHECK (pontos >= 0)
);

DROP TABLE IF EXISTS Fidelizacao;

CREATE TABLE Fidelizacao (
    id                  INTEGER,
    diasMinimo          INTEGER NOT NULL,

    CONSTRAINT FidelizacaoPK PRIMARY KEY (id),
    CONSTRAINT FidelizacaoId FOREIGN KEY (id) REFERENCES Conquista ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FidelizacaoDiasMin CHECK (diasMinimo >= 0)
);

DROP TABLE IF EXISTS NivelPontos;

CREATE TABLE NivelPontos (
    id                  INTEGER,
    pontosMinimo        INTEGER NOT NULL,

    CONSTRAINT NivelPontosPK PRIMARY KEY (id),
    CONSTRAINT NivelPontosId FOREIGN KEY (id) REFERENCES Conquista ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT NivelPontospontosMinimo CHECK (pontosMinimo >= 0)
);

DROP TABLE IF EXISTS NumeroCompras;

CREATE TABLE NumeroCompras (
    id                  INTEGER,
    comprasMinimo       INTEGER NOT NULL,

    CONSTRAINT NumeroComprasPK PRIMARY KEY (id),
    CONSTRAINT NumeroComprasId FOREIGN KEY (id) REFERENCES Conquista ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT NumeroComprasComprasMinimo CHECK (comprasMinimo >= 0)
);

DROP TABLE IF EXISTS Conquistou;

CREATE TABLE Conquistou (
    idCliente           INTEGER,
    idConquista         INTEGER,

    CONSTRAINT ConquistouPK PRIMARY KEY (idCliente, idConquista),
    CONSTRAINT ConquistouIdCliente FOREIGN KEY (idCliente) REFERENCES Cliente ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ConquistouIdConquista FOREIGN KEY (idConquista) REFERENCES Conquista ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra(
    id                  INTEGER,
    idCliente           INTEGER NOT NULL,
    valor               REAL NOT NULL,
    dataHora            DATE NOT NULL,
    pontos              INTEGER NOT NULL,
    idSazonal           INTEGER,
    idPorPontos         INTEGER,

    CONSTRAINT CompraPK PRIMARY KEY (id),
    CONSTRAINT CompraIdCliente FOREIGN KEY (idCliente) REFERENCES Cliente ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CompraUNIQUE UNIQUE(idCliente, dataHora),
    CONSTRAINT CompraValor CHECK (valor >= 0),
    CONSTRAINT CompraPontos CHECK (pontos >= 0),
    CONSTRAINT CompraIdSazonal FOREIGN KEY (idSazonal) REFERENCES DescontoSazonal ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT CompraIdPorPontos FOREIGN KEY (idPorPontos) REFERENCES DescontoPorPontos ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT CompraDescontoAplicado CHECK (idSazonal IS NULL OR idPorPontos IS NULL),
    CONSTRAINT CompraPontosValor CHECK (pontos = CAST(valor AS  INTEGER)),
    CONSTRAINT CompraDataHora CHECK (dataHora IS strftime('%Y-%m-%d %H:%M:%S', dataHora))
);

DROP TABLE IF EXISTS CompraDoBundle;

CREATE TABLE CompraDoBundle(
    idCompra            INTEGER,
    idBundle            INTEGER,
    quantidade          INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT CompraDoBundlePK PRIMARY KEY (idCompra, idBundle),
    CONSTRAINT CompraDoBundleIdCompra FOREIGN KEY (idCompra) REFERENCES Compra ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CompraDoBundleIdBundle FOREIGN KEY (idBundle) REFERENCES Bundle ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CompraDoBundleQuantidade CHECK (quantidade > 0)
);

DROP TABLE IF EXISTS CompraDoProduto;

CREATE TABLE CompraDoProduto(
    idCompra            INTEGER,
    idProduto           INTEGER,
    quantidade          INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT CompraDoProdutoPK PRIMARY KEY (idCompra, idProduto),
    CONSTRAINT CompraDoProdutoIdCompra FOREIGN KEY (idCompra) REFERENCES Compra ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CompraDoProdutoIdProduto FOREIGN KEY (idProduto) REFERENCES Produto ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CompraDoProdutoQuantidade CHECK (quantidade > 0)
);

DROP TABLE IF EXISTS DescontoEspecial;

CREATE TABLE DescontoEspecial(
    id                  INTEGER,
    percentagem         REAL NOT NULL DEFAULT 0.1,
    descricao           VARCHAR(50),
    dataInicio          DATE NOT NULL,
    dataFim             DATE NOT NULL,

    CONSTRAINT DescontoEspecialPK PRIMARY KEY (id),
    CONSTRAINT DescontoEspecialUNIQUE UNIQUE(percentagem,dataInicio,dataFim),
    CONSTRAINT DescontoEspecialPercentagem CHECK (percentagem >= 0 AND percentagem <= 0.7),
    CONSTRAINT DescontoEspecialDataInicio CHECK (dataInicio IS strftime('%Y-%m-%d', dataInicio)),
    CONSTRAINT DescontoEspecialDataFim CHECK (dataFim IS strftime('%Y-%m-%d', dataFim)),
    CONSTRAINT DescontoEspecialDatas CHECK (dataFim >= dataInicio)
);

DROP TABLE IF EXISTS DescontoSazonal;

CREATE TABLE DescontoSazonal(
    id                  INTEGER,
    percentagem         REAL NOT NULL DEFAULT 0.1,
    descricao           VARCHAR(50),
    dataInicio          DATE NOT NULL,
    dataFim             DATE NOT NULL,

    CONSTRAINT DescontoSazonalPK PRIMARY KEY (id),
    CONSTRAINT DescontoSazonalUNIQUE UNIQUE(percentagem,dataInicio,dataFim),
    CONSTRAINT DescontoSazonalPercentagem CHECK (percentagem >= 0 AND percentagem <= 0.7),
    CONSTRAINT DescontoSazonalDataIncio CHECK (dataInicio IS strftime('%Y-%m-%d', dataInicio)),
    CONSTRAINT DescontoSazonalDataFim CHECK (dataFim IS strftime('%Y-%m-%d', dataFim)),
    CONSTRAINT DescontoSazonalDatas CHECK (dataFim >= dataInicio)
);

DROP TABLE IF EXISTS DescontoPorPontos;

CREATE TABLE DescontoPorPontos(
    id                  INTEGER,
    percentagem         REAL NOT NULL DEFAULT 0.1,
    descricao           VARCHAR(50),
    pontosMinimo           INTEGER NOT NULL,
    pontosMaximo           INTEGER NOT NULL,

    CONSTRAINT DescontoPorPontosPK PRIMARY KEY (id),
    CONSTRAINT DescontoPorPontosUNIQUE UNIQUE(percentagem,pontosMinimo,pontosMaximo),
    CONSTRAINT DescontoPorPontosPercentagem CHECK (percentagem >= 0 AND percentagem <= 0.7),
    CONSTRAINT DescontoPorPontospontosMinimo CHECK (pontosMinimo >= 0),
    CONSTRAINT DescontoPorPontospontosMaximo CHECK (pontosMaximo >= 0),
    CONSTRAINT DescontoPorPontosPontos CHECK (pontosMaximo > pontosMinimo)
);
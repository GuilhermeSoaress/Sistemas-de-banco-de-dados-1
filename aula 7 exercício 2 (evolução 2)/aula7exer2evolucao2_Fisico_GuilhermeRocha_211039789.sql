-- -------- < aula7exer2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/05/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula7exer2
--
-- PROJETO => 01 Base de Dados
--         => 09 tabelas
--        
-- 
-- Ultimas Alteracoes
--   24/05/223 => Criação do script
-- ---------------------------------------------------------
CREATE DATABASE aula7exer2;

USE aula7exer2;

CREATE TABLE TIPOPERFUMARIA(
    idTipoPerfumaria INT NOT NULL,
    descricaoTipoPerfumaria varchar(100) NOT NULL
    CONSTRAINT TIPOPERFUMARIA_PK PRIMARY KEY (idTipoPerfumaria)
) ENGINE = InnoDB;

CREATE TABLE TIPOEMBALAGEM(
	idTipoEmbalagem INT NOT NULL,
    descricaoEmbalagem VARCHAR(100) NOT NULL,
    CONSTRAINT TIPOEMBALAGEM_PK PRIMARY KEY(idTipoEmbalagem)
)ENGINE = InnoDB;

CREATE TABLE FABRICANTE(
	cgc DECIMAL(14,0) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cep DECIMAL(8,0) NOT NULL,
	rua varchar(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	numero DECIMAL(5,0) NOT NULL,
    CONSTRAINT FABRICANTE_PK Primary Key(cgc)
)ENGINE = InnoDB;

CREATE TABLE TELEFONE(
	telefone decimal(11,0) NOT NULL,
	cgcFabricante  DECIMAL(14,0) NOT NULL,
	CONSTRAINT TELEFONE_PK Primary Key(telefone,cgcFabricante),
	CONSTRAINT TELEFONE_FABRICANTE_FK Foreign Key(cgcFabricante) REFERENCES FABRICANTE(cgc)
)ENGINE = InnoDB;

CREATE TABLE PRODUTO(
	codigoControle DECIMAL(12,0) NOT NULL,
    nomeComercial VARCHAR(100) NOT NULL,
    quantidade DECIMAL(5,0) NOT NULL,
    precoUnitario DECIMAL(6,2) NOT NULL,
    cgcFabricante DECIMAL(14,0) NOT NULL,
    idTipoEmbalagem INT NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY(codigoControle),
    CONSTRAINT PRODUTO_TIPOEMBALAGEM_FK FOREIGN KEY(idTipoEmbalagem) REFERENCES TIPOEMBALAGEM (idTipoEmbalagem),
    CONSTRAINT PRODUTO_FABRICANTE_FK FOREIGN KEY(cgcFabricante) REFERENCES FABRICANTE (cgc)
)ENGINE = InnoDB;

CREATE TABLE PERFUME(
	idPerfume INT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    fragancia VARCHAR(100) NOT NULL,
    codigoProduto DECIMAL(12,0) NOT NULL,
    CONSTRAINT PERFUME_PK PRIMARY KEY(idPerfume),
    CONSTRAINT PERFUME_PRODUTO_FK FOREIGN KEY(codigoProduto) REFERENCES PRODUTO(codigoControle)
)ENGINE = InnoDB;

CREATE TABLE MEDICAMENTO(
	idMedicamento INT NOT NULL,
    formula VARCHAR(100) NOT NULL,
    tarja VARCHAR(100) NOT NULL,
    codigoProduto DECIMAL(12,0) NOT NULL,
    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY(idMedicamento),
    CONSTRAINT MEDICAMENTO_PRODUTO_FK FOREIGN KEY(codigoProduto) REFERENCES PRODUTO(codigoControle)
)ENGINE = InnoDB;

CREATE TABLE RECEITA(
	dtEmissao DATE NOT NULL,
    crmEstado VARCHAR(2) NOT NULL,
    crmNumero DECIMAL(6,0) NOT NULL,
    idReceita INT NOT NULL,
    idMedicamento INT NOT NULL,
    CONSTRAINT RECEITA_PK PRIMARY KEY(idReceita),
	CONSTRAINT RECEITA_MEDICAMENTO_FK FOREIGN KEY(idMedicamento) REFERENCES MEDICAMENTO(idMedicamento)
)ENGINE = InnoDB;

CREATE TABLE VENDA(
	dtCompra DATE NOT NULL,
    numeroNotaFiscal DECIMAL(9,0) NOT NULL,
    nomeCliente VARCHAR(100) NOT NULL,
    imposto DECIMAL(6,2) NOT NULL,
    idReceita INT,
    CONSTRAINT VENDA_PK PRIMARY KEY(numeroNotaFiscal),
	CONSTRAINT VENDA_RECEITA_FK FOREIGN KEY(idReceita) REFERENCES RECEITA(idReceita)
)ENGINE = InnoDB;

CREATE TABLE VENDIDO(
	codigoProduto DECIMAL(12,0),
    numeroNotaFiscal DECIMAL(9,0),
    quantidade DECIMAL(3,0),
	CONSTRAINT VENDIDO_PK PRIMARY KEY(codigoProduto, numeroNotaFiscal),
	CONSTRAINT VENDIDO_PRODUTO_FK FOREIGN KEY(codigoProduto) REFERENCES PRODUTO(codigoControle),
    CONSTRAINT VENDIDO_VENDA_FK FOREIGN KEY(numeroNotaFiscal) REFERENCES VENDA(numeroNotaFiscal)
)ENGINE = InnoDB;
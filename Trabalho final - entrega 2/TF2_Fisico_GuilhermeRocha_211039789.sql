-- -------- < TRABALHO FINAL > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 19/06/2023
-- Autor(es) ..............: João Victor Max Bisinotti de Oliveira, Guilherme Soares Rocha 
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2D2
--
-- PROJETO => 01 Base de Dados
--         => 08 tabelas
--        
-- 
-- Ultimas Alteracoes
--   19/06/2023 => Criação do script
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS TF2D2;

USE TF2D2;

CREATE TABLE FUNCIONARIO (
	cpf DECIMAL(11,0) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    ddd DECIMAL(2,0) NOT NULL,
    numero DECIMAL(9,0) NOT NULL,
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY(cpf) 
) ENGINE=InnoDB;

CREATE TABLE FORNECEDOR (
	idFornecedor INT NOT NULL AUTO_INCREMENT,
    nomeFornecedor VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    ddd DECIMAL(2,0) NOT NULL,
    numero DECIMAL(9,0) NOT NULL,
    CONSTRAINT FORNECEDOR_PK PRIMARY KEY(idFornecedor) 
) ENGINE=InnoDB;

CREATE TABLE TRANSACAO (
	idTransacao INT NOT NULL AUTO_INCREMENT,
    formaPagamento ENUM('BOLETO','DEBITO','CREDITO','PIX','DINHEIRO') NOT NULL,
    tipoTransacao ENUM('COMPRA','VENDA') NOT NULL,
    cpfFuncionario DECIMAL(11,0),
    CONSTRAINT TRANSACAO_PK PRIMARY KEY(idTransacao),
    CONSTRAINT TRANSACAO_FUNCIONARIO_FK FOREIGN KEY(cpfFuncionario) REFERENCES FUNCIONARIO(cpf)
) ENGINE=InnoDB;

CREATE TABLE NOTAFISCAL (
	idNota INT NOT NULL AUTO_INCREMENT,
    dtEmissao DATE NOT NULL,
    idTransacao INT,
    CONSTRAINT NOTAFISCAL_PK PRIMARY KEY(idNota),
    CONSTRAINT NOTAFISCAL_TRANSACAO_FK FOREIGN KEY(idTransacao) REFERENCES TRANSACAO(idTransacao)
) ENGINE=InnoDB;

CREATE TABLE SETOR (
	idSetor INT NOT NULL AUTO_INCREMENT,
    nomeSetor VARCHAR(100) NOT NULL,
    CONSTRAINT SETOR_PK PRIMARY KEY(idSetor)
) ENGINE=InnoDB;

CREATE TABLE PRODUTO (
	idProduto INT NOT NULL AUTO_INCREMENT,
    nomeProduto VARCHAR(100) NOT NULL,
    precoProduto DECIMAL(7,2) NOT NULL,
    dtValidade DATE NOT NULL,
    idSetor INT,
    CONSTRAINT PRODUTO_PK PRIMARY KEY(idProduto),
    CONSTRAINT PRODUTO_SETOR_FK FOREIGN KEY(idSetor) REFERENCES SETOR(idSetor)
) ENGINE=InnoDB;

CREATE TABLE inclui (
	idTransacao INT NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT inclui_TRANSACAO_FK FOREIGN KEY(idTransacao) REFERENCES TRANSACAO(idTransacao),
    CONSTRAINT inclui_PRODUTO_FK FOREIGN KEY(idProduto) REFERENCES PRODUTO(idProduto)
) ENGINE=InnoDB;

CREATE TABLE fornece (
    idProduto INT NOT NULL,
    idFornecedor INT NOT NULL,
    CONSTRAINT fornece_PRODUTO_FK FOREIGN KEY(idProduto) REFERENCES PRODUTO(idProduto),
    CONSTRAINT fornece_FORNECEDOR_FK FOREIGN KEY(idFornecedor) REFERENCES FORNECEDOR(idFornecedor)
) ENGINE=InnoDB;
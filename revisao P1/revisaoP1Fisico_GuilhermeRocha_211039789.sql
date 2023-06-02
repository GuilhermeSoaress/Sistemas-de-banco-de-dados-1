-- -------- < REVISAO P1 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/05/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: revisaop1
--
-- PROJETO => 01 Base de Dados
--         => 09 tabelas
--        
-- 
-- Ultimas Alteracoes
--   30/05/223 => Criação do script
-- ---------------------------------------------------------
CREATE DATABASE revisaop1;

USE revisaop1;

CREATE TABLE CONTA (
    idConta INT NOT NULL AUTO_INCREMENT,
    dtAbertura DATE NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL,
    cpfCliente VARCHAR(11) NOT NULL,
    idAgencia INT NOT NULL,
    idTransacao INT NOT NULL,
    CONSTRAINT CONTA_PK PRIMARY KEY (idConta),
    CONSTRAINT CONTA_CLIENTE_FK FOREIGN KEY (cpfCliente) REFERENCES CLIENTE(cpf),
    CONSTRAINT CONTA_AGENCIA_FK FOREIGN KEY (idAgencia) REFERENCES AGENCIA(idAgencia)
)ENGINE=InnoDB;

CREATE TABLE AGENCIA (
    idAgencia INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT AGENCIA_PK PRIMARY KEY (idAgencia),
    CONSTRAINT AGENCIA_ENDERECO_PK FOREIGN KEY (idEndereco) REFERENCES ENDERECO(idEndereco)
)ENGINE=InnoDB;

CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    complemento VARCHAR(100),
    CONSTRAINT ENDERECO_PK PRIMARY KEY (idEndereco)
)ENGINE=InnoDB;

CREATE TABLE CLIENTE (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    dtNascimento DATE NOT NULL,
    sexo INT NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT CLIENTE_ENDERECO_FK FOREIGN KEY (idEndereco) REFERENCES ENDERECO(idEndereco)
)ENGINE=InnoDB;

CREATE TABLE TRANSACAO (
    idTransacao INT NOT NULL AUTO_INCREMENT,
    operacao VARCHAR(1) NOT NULL,
    dtTransacao DATE NOT NULL,
    horarioTransacao TIME NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    comentario VARCHAR(100),
    idConta INT NOT NULL,
    CONSTRAINT TRANSACAO_PK PRIMARY KEY (idTransacao),
    CONSTRAINT TRANSACAO_CONTA_FK FOREIGN KEY (idConta) REFERENCES CONTA(idConta)
)ENGINE=InnoDB;

CREATE TABLE email (
	email VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT EMAIL_CLIENTE_FK FOREIGN KEY (cpf) REFERENCES CLIENTE (cpf)
) ENGINE=InnoDB;
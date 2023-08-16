-- -------- < Aula 10 Exercício Extra 1 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 19/06/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 2 tabelas
-- 
-- Ultimas Alteracoes
--   19/06/2023 => Criação do SCRIPT físico
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula10extra1;

USE aula10extra1;

CREATE TABLE ESTADO (
    sigla CHAR(2) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    CONSTRAINT ESTADO_PF PRIMARY KEY (sigla)
)ENGINE=InnoDB;

CREATE TABLE CIDADE (
    codigo INTEGER(5) NOT NULL AUTO_INCREMENT,
    nome CHAR(50) NOT NULL,
    habitantes BIGINT NOT NULL,
    sigla CHAR(2) NOT NULL,
    CONSTRAINT CIDADE_PK PRIMARY KEY (codigo),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (sigla) REFERENCES ESTADO(sigla) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CIDADE_UK UNIQUE (nome, sigla)
)ENGINE=InnoDB AUTO_INCREMENT=1;

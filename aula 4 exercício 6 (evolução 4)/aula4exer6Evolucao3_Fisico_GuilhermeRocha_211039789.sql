-- -------- < aula4exer6Evolucao4_Fisico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 22/05/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 09 tabelas
--        
-- 
-- Ultimas Alteracoes

-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao4;

USE aula4exer6Evolucao4;



CREATE TABLE VEICULO (
    placaVeiculo CHAR(7) NOT NULL,
    chassi CHAR(17) NOT NULL,
    corPredominante VARCHAR(20) NOT NULL,
    idCategoria CHAR(2) NOT NULL,
    idModelo CHAR(6) NOT NULL,
    anoFabricacao DATE NOT NULL,
    cpf CHAR(11) NOT NULL,
    CONSTRAINT VEICULO_PK PRIMARY KEY (placaVeiculo),
    CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (idModelo) REFERENCES MODELO (idModelo),
    CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (idCategoria) REFERENCES CATEGORIA (idCategoria)
);

CREATE TABLE PROPRIETARIO (
    cpf CHAR(11) NOT NULL,
    nomeCompleto VARCHAR(30) NOT NULL,
    telefone CHAR(13) NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    dataNascimento DATE NOT NULL,
    estado VARCHAR(25) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    rua VARCHAR(25) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero int(4) NOT NULL,
    complemento VARCHAR(20),
    CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf),
    CONSTRAINT PROPRIETARIO_TELEFONE_FK FOREIGN KEY (telefone) REFERENCES telefone (telefone)
);

CREATE TABLE telefone (
    telefone NUMERIC(11) NOT NULL,
    cpf CHAR(11) NOT NULL,
    CONSTRAINT telefone_PK PRIMARY KEY (telefone), 
    CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpfPaciente)
      REFERENCES PROPRIETARIO (cpfPaciente)
);

CREATE TABLE MODELO (
    idModelo NUMERIC(6) NOT NULL,
    nomeModelo VARCHAR(20) NOT NULL,
    CONSTRAINT MODELO_PK PRIMARY KEY (idModelo)
);

CREATE TABLE CATEGORIA (
    idCategoria NUMERIC(2) NOT NULL,
    nomeCategoria VARCHAR(20) NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (idCategoria)
);

CREATE TABLE TIPOINFRACAO (
    idInfracao CHAR(3) NOT NULL,
    nomeInfracao VARCHAR(30) NOT NULL,
    valorCobrado FLOAT(5,2) NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (idInfracao)
);

CREATE TABLE AGENTE (
    matriculaAgente NUMERIC(8) NOT NULL,
    nomeCompleto VARCHAR(30) NOT NULL,
    dataContratacao DATE NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaAgente)
);

CREATE TABLE LOCAL (
    idLocal CHAR(3) NOT NULL,
    latitude NUMERIC(10,2) NOT NULL,
    longitude NUMERIC(10,2) NOT NULL,
    velocidadePermitida NUMERIC(3) NOT NULL,
    CONSTRAINT LOCAL_PK PRIMARY KEY (idLocal)
);

CREATE TABLE INFRACAO (
    placaVeiculo CHAR(7) NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    idInfracao CHAR(3) NOT NULL,
    idLocal CHAR(3) NOT NULL,
    matriculaAgente CHAR(8) NOT NULL,
    velocidade NUMERIC,
    CONSTRAINT INFRACAO_PK PRIMARY KEY (data, hora, placaVeiculo),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaAgente) REFERENCES AGENTE (matriculaAgente),
    CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idInfracao) REFERENCES TIPOINFRACAO (idInfracao),
    CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placaVeiculo) REFERENCES VEICULO (placaVeiculo),
    CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (idLocal) REFERENCES LOCAL (idLocal)
);


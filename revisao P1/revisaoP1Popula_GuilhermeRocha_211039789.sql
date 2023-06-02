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
--   30/05/223 => Criação do script popula
-- ---------------------------------------------------------
CREATE DATABASE revisaop1;

USE revisaop1;

INSERT INTO CONTA (dtAbertura, saldo, cpfCliente, idAgencia, idTransacao)
VALUES ('2022-01-01', 5000.00, '12345678901', 1, 1),
       ('2022-02-15', 1500.00, '23456789012', 2, 2),
       ('2022-03-30', 10000.00, '34567890123', 1, 3);

INSERT INTO AGENCIA (nome, idEndereco)
VALUES ('Agência Central', 1),
       ('Agência Norte', 2),
       ('Agência Sul', 3);

INSERT INTO ENDERECO (rua, numero, bairro, cep, cidade, estado, complemento)
VALUES ('Rua A', 123, 'Centro', '12345-678', 'Cidade A', 'AA', 'Apto 1'),
       ('Rua B', 456, 'Bairro X', '98765-432', 'Cidade B', 'BB', NULL),
       ('Rua C', 789, 'Bairro Y', '54321-876', 'Cidade C', 'CC', 'Bloco 2');

INSERT INTO CLIENTE (cpf, nome, telefone, dtNascimento, sexo, idEndereco)
VALUES ('12345678901', 'João Silva', '9999999999', '1990-01-01', 1, 1),
       ('23456789012', 'Maria Santos', '8888888888', '1985-05-10', 0, 2),
       ('34567890123', 'Pedro Oliveira', '7777777777', '1995-12-15', 1, 3);

INSERT INTO TRANSACAO (operacao, dtTransacao, horarioTransacao, valor, comentario, idConta)
VALUES ('D', '2022-01-02', '09:30:00', 1000.00, 'Depósito em dinheiro', 1),
       ('S', '2022-02-18', '14:45:00', 500.00, 'Saque realizado', 2),
       ('D', '2022-03-31', '11:15:00', 2000.00, 'Transferência recebida', 3);
       
INSERT INTO email (email, cpf)
VALUES ('joaosilva@gmail.com', 12345678901),
		('marisantos@gmail.com', 23456789012),
        ('pedrooliveira@outlook.com', 34567890123);

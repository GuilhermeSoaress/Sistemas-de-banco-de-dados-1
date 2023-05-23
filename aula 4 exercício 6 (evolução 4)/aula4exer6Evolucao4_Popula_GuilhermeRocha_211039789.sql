 -- -------- < aula4exer6Evolucao3_Fisico > --------
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
--
--  22/05/223 => Criação do sql popula.
-- ---------------------------------------------------------

USE aula4exer6Evolucao4

INSERT INTO VEICULO
VALUES 
    ('ABC123', '12345678912345678', 'Vermelho', 1, 1, 2022, '12345678901'),
    ('DEF456', '98765432109876543', 'Azul', 2, 2, 2021, '98765432109'),
    ('GHI789', '45678912345678901', 'Preto', 3, 3, 2020, '45678912345');

INSERT INTO PROPRIETARIO 
VALUES
    ('12345678901', 'João da Silva', '(11) 1234-5678', 'M', '1990-01-01', 'São Paulo', 'São Paulo', 'Centro', 'Rua A', '01234-567', 123, 'Apartamento 1'),
    ('98765432109', 'Maria Souza', '(21) 9876-5432', 'F', '1985-05-10', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Avenida B', '04567-890', 456, 'Bloco C'),
    ('45678912345', 'Carlos Oliveira', '(31) 4567-8901', 'M', '1988-09-15', 'Minas Gerais', 'Belo Horizonte', 'Barreiro', 'Rua C', '07890-123', 789, NULL);

INSERT INTO MODELO
VALUES
    (1, 'Modelo A'),
    (2, 'Modelo B'),
    (3, 'Modelo C');

INSERT INTO CATEGORIA
VALUES
    (1, 'Categoria A'),
    (2, 'Categoria B'),
    (3, 'Categoria C');

INSERT INTO TIPOINFRACAO 
VALUES
    ('001', 'Infracao A', 100.00),
    ('002', 'Infracao B', 200.00),
    ('003', 'Infracao C', 150.00);

INSERT INTO AGENTE
VALUES
    (12345678, 'Agente A', '2020-01-01'),
    (23456789, 'Agente B', '2018-05-10'),
    (34567890, 'Agente C', '2019-09-15');

INSERT INTO LOCAL 
VALUES
    ('001', 40.7128, -74.0060, 60),
    ('002', -22.9068, -43.1729, 50),
    ('003', 51.5074, -0.1278, 70);

INSERT INTO INFRACAO
VALUES
    ('ABC1234', '2023-10-02', '12:34:56', '001', '001', '12345678', 80),
    ('DEF5678', '2001-1-17', '14:30:00', '002', '002', '23456789', 65),
    ('GHI9012', '2007-05-30', '16:45:12', '003', '003', '34567890', 70);

-- -------- < Aula 10 Exercício Extra 1 > --------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 19/06/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 2 tabelas
-- 
-- Ultimas Alteracoes
--   19/06/2023 => Criação do SCRIPT para popular as tabelas
--
-- ---------------------------------------------------------

USE aula10extra1;

INSERT INTO ESTADO (sigla, nome) VALUES
	('SC', 'Santa Catarina'),
	('SP', 'São Paulo'),
    ('AM', 'Amazonas'),
    ('DF', 'Distrito Federal'),
    ('GO', 'Goiás');
    

INSERT INTO CIDADE (nome, habitantes, sigla) VALUES
	('Florianópolis', 16000000, 'SC'),
	('São Paulo', 4900000, 'SP'),
	('Manaus', 2500000, 'AM'),
	('Campinas', 1200000, 'SP'),
	('Valparaíso', 500000, 'GO'),
	('Balneário Camburiú', 700000, 'SC'),
	('Santos', 430000, 'SP'),
    ('Taguatinga', 300000, 'DF'),
    ('Goiânia', 1500000, 'GO'),
	('Brasília', 3000000, 'DF'),
    ('Anápolis', 400000, 'GO'),
    ('Ceilândia', 500000, 'DF'),
    ('Luziânia', 200000, 'GO'),
    ('Planaltina', 150000, 'DF');

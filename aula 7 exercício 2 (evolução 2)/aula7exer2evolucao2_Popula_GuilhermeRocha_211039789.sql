-- -------- < aula7exer2 > --------
--
--                    SCRIPT DE POPULA (DDL)
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
USE aula7exer2;

INSERT INTO TIPOPERFUMARIA (idTipoPerfumaria, descricaoTipoPerfumaria)
VALUES
    (1, 'Perfumes'),
    (2, 'Cosméticos'),
    (3, 'Higiene Pessoal'),
    (4, 'Cuidados com a Pele'),
    (5, 'Cuidados com o Cabelo'),
    (6, 'Maquiagem');


INSERT INTO TIPOEMBALAGEM VALUES
	(1, 'plastico'),
    (2, 'papel'),
    (3, 'papelão');
    (4, 'Frasco de vidro'),
    (5, 'Tubo de plástico'),
    (6, 'Bisnaga');
    
INSERT INTO FABRICANTE VALUES
	(97008009000180,'fabrica de remedio', 12345678,'Rua central', 'Ipanema', 'rio de janeiro', 'rj', '10'),
	(78054604000108,'fabrica de perfume', 12315623,'Rua paralela', 'Sudoeste', 'brasilia', 'df', '12'),
    (86411618000160,'DIGIMED', 77766623,'Rua Brigadeiro', 'Gama', 'brasilia', 'df', '14');
    (12345678900012, 'Fabricante A', 12345678, 'Rua dos Fabricantes', 'Centro', 'São Paulo', 'SP', 123),
    (98765432100123, 'Fabricante B', 87654321, 'Avenida das Indústrias', 'Vila Industrial', 'Campinas', 'SP', 456),
    (56789012300678, 'Fabricante C', 34567890, 'Rua das Produções', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', 789);
    
INSERT INTO TELEFONE VALUES
	('21999010737', 97008009000180),
    ('61999944101', 78054604000108),
    ('61999825484', 86411618000160);
    ('11987654321', 12345678900012),
    ('2134567890', 98765432100123),
    ('31987654321', 56789012300678);

INSERT INTO PRODUTO VALUES
	(1, 'Claritin D', 100, 19.90, 97008009000180, 3),
    (2, 'YSL Y', 20, 919.00, 78054604000108, 1),
    (3, 'SAVAGE', 10, 790.20, 78054604000108, 1),
    (4, 'MALBEC', 10, 90.00, 78054604000108, 1),
    (5, 'Alegra', 10, 29.99, 86411618000160, 2),
    (6, 'Inzelm', 10, 89.99, 86411618000160, 2);

INSERT INTO PERFUME VALUES
	(1, 'importado', 'couro', 2),
    (2, 'importado', 'doce', 3),
    (3, 'nacional', 'frutas', 4);
    (4, 'Eau de Parfum', 'Floral', 5),
    (5, 'Eau de Toilette', 'Cítrico',6),
    (6, 'Colônia', 'Amadeirado', 7);
    
INSERT INTO MEDICAMENTO VALUES
	(1, 'formula 1', 'sem tarja', 1),
    (2, 'formula 2', 'preta', 5),
    (3, 'formula 3', 'vermelha', 6);
    (4, 'Paracetamol', 'Sem Tarja', 123456789012),
    (5, 'Dipirona Sódica', 'Tarja Vermelha', 987654321098),
    (6, 'Omeprazol', 'Tarja Vermelha', 567890123456);

INSERT INTO RECEITA VALUES
	('2023-11-25', 'df',12345, 1, 1),
	('2023-7-03', 'df',77890, 2, 2),
    ('2022-6-05', 'df',00462, 3, 3);
    ('2023-01-15', 'sp', 123456, 4, 4),
    ('2023-02-28', 'rj', 987654, 5, 5),
    ('2023-03-10', 'mg', 567890, 6, 6);

INSERT INTO VENDA VALUES
	('2023-11-25', 123456789,'Pedro', 19.90, 1),
	('2023-7-03', 121632456,'Lucas', 19.90, 1),
    ('2022-6-15', 256786357,'Miguel', 19.90, NULL);
    ('2023-01-20', 123456789, 'Cliente A', 10.50, 1),
    ('2023-02-15', 987654321, 'Cliente B', 12.75, 2),
    ('2023-03-05', 567890123, 'Cliente C', 8.25, 3);

INSERT INTO VENDIDO VALUES
	(1, 123456789, 10),
    (2, 121632456, 1),
    (3, 256786357, 2);
    (4, 123456789, 2),
    (5, 987654321, 1),
    (6, 567890123, 3);

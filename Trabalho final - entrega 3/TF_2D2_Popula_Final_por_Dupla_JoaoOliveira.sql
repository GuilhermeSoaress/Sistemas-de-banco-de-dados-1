-- -------- < TRABALHO FINAL > --------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 19/06/2023
-- Autor(es) ..............: João Victor Max Bisinotti de Oliveira, Guilherme Soares Rocha 
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2D2
--
-- PROJETO => 01 Base de Dados
--         => 11 tabelas
--        
-- 
-- Ultimas Alteracoes
--   19/06/2023 => Criação do script
--   03/07/2023 => Populando novas tabelas
-- ---------------------------------------------------------

USE TF_2D2_joaooliveira;

INSERT INTO PESSOA VALUES 
	(84413568925, 'João Silva', 2500.00, 11, 995211275),
    (98765432198, 'Maria Souza', 3800.00, 61, 986425986),
    (56789012345, 'Pedro Santos', 5200.00, 61, 985488326),
	(32165498732, 'Ana Costa', 4100.00, 61, 923589914),
	(89012345678, 'Carlos Oliveira', 6300.00, 21, 958969354);
    
INSERT INTO SOCIO VALUES 
	(NULL, 'Financeiro', 84413568925),
    (NULL, 'Administradora', 98765432198),
    (NULL, 'Açougueiro', 56789012345),
	(NULL, 'Financeiro', 32165498732),
	(NULL, 'Administrador', 89012345678);   
    
INSERT INTO FUNCIONARIO VALUES 
	(NULL, 84413568925),
    (NULL, 98765432198),
    (NULL, 56789012345),
	(NULL, 32165498732),
	(NULL, 89012345678);        

INSERT INTO FORNECEDOR VALUES
    (NULL, 'Mercado Oliveira', 'mercadoliveira@gmail.com', 11, 958692351),
    (NULL, 'Roberto carnes', 'roberto@gmail.com', 62, 965254551),
    (NULL, 'Dia a dia', 'diaadia@gmail.com', 61, 989652325),
    (NULL, 'Distribuidora Gomes', 'gomesdistribuidora@gmail.com', 61, 995899412),
    (NULL, 'açoguerocha', 'açoguerocha@gmail.com', 21, 913254748);
    
INSERT INTO TRANSACAO VALUES
	(NULL, 'BOLETO', 'COMPRA', '2023-06-01', '09:00:00', 1),
	(NULL, 'DEBITO', 'VENDA', '2023-06-02', '10:30:00', 1),
	(NULL, 'CREDITO', 'COMPRA', '2023-06-02', '13:15:00', 2),
	(NULL, 'PIX', 'VENDA', '2023-06-04', '15:45:00', 2),
	(NULL, 'DINHEIRO', 'COMPRA', '2023-06-04', '17:30:00', 3);
    
INSERT INTO NOTAFISCAL VALUES
	(NULL, '2023-06-01', 1),
    (NULL, '2023-06-02', 2),
	(NULL, '2023-06-03', 3),
	(NULL, '2023-06-04', 4),
	(NULL, '2023-06-05', 5);
    
INSERT INTO SETOR VALUES
    (NULL, 'Açougue'),
    (NULL, 'Mercearia'),
    (NULL, 'Bebidas'),
    (NULL, 'Temperos'),
    (NULL, 'Artigos Churrasco');
    
INSERT INTO MARCA VALUES
    (NULL, 'Friboi'),
    (NULL, 'Sadia'),
    (NULL, 'Carvões Carvalho'),
    (NULL, 'Temperos Prado'),
    (NULL, 'Alasca');    
    
INSERT INTO PRODUTO VALUES 
	(NULL, 'Picanha', 79.99, '2024-06-30', '2023-06-12', 10, 1, 1),
	(NULL, 'Sobrecoxa', 29.99, '2024-07-15', '2023-06-25', 15, 1, 2),
	(NULL, 'Gelo', 9.99, '2024-06-25', '2023-09-21', 20, 3, 5),
	(NULL, 'Carvão', 15.99, '2025-07-05', '2023-08-11', 25, 5, 3),
	(NULL, 'Sal', 24.99, '2025-06-20', '2023-07-30', 30, 4, 4);
    
INSERT INTO inclui VALUES
	(1, 2),
    (2, 5),
    (1, 4),
    (2, 3),
    (2, 2);
    
INSERT INTO fornece VALUES
	(1, 2),
    (2, 5),
    (1, 4),
    (2, 3),
    (2, 2);
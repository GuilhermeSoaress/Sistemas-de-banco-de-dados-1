-- -------- < TRABALHO FINAL > --------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 03/07/2023
-- Autor(es) ..............: João Victor Max Bisinotti de Oliveira, Guilherme Soares Rocha 
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF2D2
--
-- PROJETO => 01 Base de Dados
--         => 11 tabelas
--        
-- 
-- Ultimas Alteracoes
--   03/07/2023 => Criação do script
-- ---------------------------------------------------------
USE TF_2D2_joaooliveira;

CREATE USER 'socio' IDENTIFIED BY 'senha_socio';
GRANT SELECT, INSERT, UPDATE, DELETE ON loja.* TO 'socio';
GRANT CREATE, DROP, ALTER ON loja.* TO 'socio';

CREATE USER 'funcionario' IDENTIFIED BY 'senha_funcionario';
GRANT SELECT, INSERT, UPDATE, DELETE ON loja.* TO 'funcionario';
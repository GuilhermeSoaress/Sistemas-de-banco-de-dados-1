-- -------- < Aula 10 Exercício Extra 1 > --------
--
--                    SCRIPT DE CONSULTA (DML)
--
-- Data Criacao ...........: 19/06/2023
-- Autor(es) ..............: Guilherme Soares Rocha
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 4 consultas
-- 
-- Ultimas Alteracoes
--   19/06/2023 => Criação do SCRIPT para consultar dados da base de dados
--
-- ---------------------------------------------------------

USE aula10extra1;

-- Primeira consulta: Projeção de sigla e nome do estado de sigla SP e DF
SELECT sigla, nome
FROM ESTADO
WHERE sigla IN ('SP', 'DF');

-- Segunda consulta: Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO
SELECT nome, sigla
FROM CIDADE
WHERE sigla IN ('SC', 'DF', 'GO');

-- Terceira consulta: Selecione todas as cidades do primeiro estado que você cadastrou mostrando somente o nome da cidade, o nome do estado e sua sigla
SELECT CIDADE.nome, ESTADO.nome, ESTADO.sigla
FROM CIDADE
JOIN ESTADO ON CIDADE.sigla = ESTADO.sigla
ORDER BY ESTADO.codigo, CIDADE.codigo
LIMIT 1;

-- Quarta consulta: Selecione somente o nome e a sigla do estado que você cadastrou por último e todas as cidades cadastradas nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome de estado e nome de cidade.
SELECT ESTADO.nome, ESTADO.sigla, CIDADE.nome, CIDADE.habitantes
FROM CIDADE
JOIN ESTADO ON CIDADE.sigla = ESTADO.sigla
WHERE ESTADO.sigla = (
    SELECT sigla
    FROM ESTADO
    ORDER BY codigo DESC
    LIMIT 1
)
ORDER BY ESTADO.nome, CIDADE.nome;

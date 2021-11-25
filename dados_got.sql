SET autocommit=0;

CREATE DATABASE `DADOSGOT`;

USE `DADOSGOT`;

CREATE TABLE `EPISODIOS`(
`ID` TINYINT PRIMARY KEY AUTO_INCREMENT,
`TEMPORADA` TINYINT,
`EPISODIO` TINYINT,
`NOME` VARCHAR(50),
`REVIEW_USUARIOS` SMALLINT,
`REVIEW_CRITICA` SMALLINT,
`US_VIEWERS` DECIMAL (5,2),
`DURACAO` TINYINT,
`DIRETOR` VARCHAR(25)
);

CREATE TABLE `PERSONAGENS`(
`ID` INT PRIMARY KEY AUTO_INCREMENT,
`NOME` VARCHAR(50),
`APARICOES` SMALLINT
);

CREATE TABLE `CASAS`(
`ID` SMALLINT PRIMARY KEY AUTO_INCREMENT,
`NOME` VARCHAR(50),
`REGIAO` VARCHAR(50)
);

SHOW TABLES;

SELECT * FROM `EPISODIOS`;

SELECT * FROM `PERSONAGENS`;

SELECT * FROM `CASAS`;

/* QUESTÃO 1: Top 10 episódios com mais views. */
SELECT TEMPORADA, EPISODIO, US_VIEWERS FROM `EPISODIOS` ORDER BY US_VIEWERS desc;
SELECT TEMPORADA, EPISODIO, US_VIEWERS FROM `EPISODIOS` WHERE US_VIEWERS >= 10.17;

/* QUESTÃO 2: Top 05 personagens que mais apareceram. */
SELECT NOME, APARICOES FROM `PERSONAGENS` ORDER BY APARICOES desc;

/* QUESTÃO 3: Top 03 regiões com mais casas. */
SELECT COUNT(NOME), REGIAO FROM `CASAS` GROUP BY REGIAO ORDER BY COUNT(NOME) desc;

/* QUESTÃO 4: Qual temporada teve mais mudanças de diretor e quantas? */
SELECT TEMPORADA, DIRETOR FROM `EPISODIOS` GROUP BY TEMPORADA, DIRETOR ORDER BY TEMPORADA;
SELECT TEMPORADA, count(distinct DIRETOR) FROM `EPISODIOS` GROUP BY TEMPORADA ORDER BY TEMPORADA;

/* QUESTÃO 5: Top 5 episódios mais avaliados pelos usuários */
SELECT TEMPORADA, EPISODIO, NOME, REVIEW_USUARIOS FROM `EPISODIOS` ORDER BY REVIEW_USUARIOS DESC LIMIT 5;

/* QUESTÃO 6: Top 5 episódios mais avaliados pela críticos*/
SELECT TEMPORADA, EPISODIO, NOME, REVIEW_CRITICA FROM `EPISODIOS` ORDER BY REVIEW_CRITICA DESC LIMIT 5;

/* QUESTÃO 7: Top 5 episódios mais longos*/
SELECT TEMPORADA, EPISODIO, NOME, DURACAO FROM `EPISODIOS` ORDER BY DURACAO DESC LIMIT 5;

/* QUESTÃO 8: Qual diretor dirigiu mais episódios*/
SELECT DISTINCT DIRETOR, count(DIRETOR) EPISODIOS_DIRIGIDOS FROM `EPISODIOS` GROUP BY DIRETOR ORDER BY count(DIRETOR) DESC LIMIT 3;

COMMIT;
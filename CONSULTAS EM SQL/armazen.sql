-- 1----

SELECT nome, sexo 
	FROM cliente;

-- 2-----

SELECT nome, preco 
	FROM produtos;

-- 3----------

SELECT cod, datas 
	FROM compras;

-- 4--------------

SELECT nome, cidade, estdCivil 
	FROM cliente;

-- 5------------

SELECT * 
	FROM cliente;

-- 6----------

SELECT nomecliente, estadocivil
	FROM cliente
ORDER BY cliente ASC;

-- 7---------

SELECT nome, preco
	FROM produto
ORDER BY preco DESC
LIMIT 1;

-- EX-------------------

SELECT nomecliente
	FROM cliente
ORDER BY random()
LIMIT 1;

-- 8-------

SELECT nomecliente, estado, cidade
	FROM cliente
ORDER BY estado, cliente;

-- 9----------

SELECT DISTINCT estado 
	FROM cliente
ORDER BY estado ASC;

-- 10--------------

SELECT DISTINCT dtcompra 
	FROM compras
ORDER BY dtcompra DESC;

-- 11-----

SELECT nome
	FROM produtos
WHERE preco > 5.00;

-- 12---





	


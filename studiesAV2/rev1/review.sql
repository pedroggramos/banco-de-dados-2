INSERT INTO "cliente" (idcliente,nomecliente,genero,estadocivil,dtnascimento,cidade,estado) VALUES (1001,'Gabriella','F','C','2006/03/21','Niterói','Rio de Janeiro');

-- FROM

SELECT DISTINCT nomecliente, genero
	FROM cliente;

-- FROM

SELECT nomeproduto, preco
	FROM produto;

-- ORDER BY ASC}

SELECT DISTINCT nomecliente, estadocivil
	FROM cliente
ORDER BY nomecliente ASC;

-- ORDER BY DESC

SELECT nomeproduto, preco
	FROM produto
ORDER BY preco DESC;

-- ORDER BY

SELECT nomecliente, estado, cidade
	FROM cliente
ORDER BY estado,cidade;

--  IS NOT NULL

SELECT DISTINCT estado
	FROM cliente
WHERE estado IS NOT NULL;

-- IS NOT NUL

SELECT DISTINCT dtcompra
	FROM compras
WHERE idcompra IS NOT NULL;

-- >

SELECT nomeproduto
	FROM produtos
WHERE preco > 5.00;

-- =

SELECT nomecliente, estadocivil
	FROM cliente
WHERE genero = 'F';

-- <

SELECT nomecliente
	FROM cliente
WHERE dtnascimento < '31/12/2004';

-- BETWEEN AND

SELECT DISTINCT idcliente
	FROM compras
WHERE dtcompra BETWEEN '01/01/2021' AND '31/12/2021';

-- DISTINCT

SELECT DISTINCT idcliente
	FROM compras
WHERE EXTRACT(YEAR FROM dtcompra) = '2020'

-- LIKE

SELECT nomecliente
	FROM cliente
WHERE nomecliente LIKE 'A%';

-- LIKE

SELECT nomecliente
	FROM cliente
WHERE nomecliente LIKE '%ana%';

--LIKE

SELECT nomecliente, estadocivil, dtnascimento, genero
	FROM cliente
WHERE nomecliente LIKE '%Gabriella%';

-- IN

SELECT nomecliente, estadocivil
	FROM cliente
WHERE estado IN('Rio de Janeiro', 'São Paulo', 'Espírito Santo', 'Minas Gerais');

-- CASE

SELECT nomecliente, estadocivil,
	CASE
		WHEN estadocivil = 'V' THEN 'Viúvo(a)'
		WHEN estadocivil = 'D' THEN 'Divorciado(a)'
		WHEN estadocivil = 'S' THEN 'Solteiro(a)'
		ELSE 'Casado(a)'
	END
FROM cliente;

-- EQUIJOIN

SELECT p.nomeproduto, m.nomemarca
	FROM produto AS p, marca AS m
WHERE p.idmarca = m.idmarca;

-- JOIN

SELECT cliente.nomecliente, produto.nomeproduto
	FROM compras
JOIN cliente ON compras.idcliente = cliente.idcliente
JOIN produto ON compras.idproduto = produto.idproduto;

-- JOIN

SELECT cliente.nomecliente, cliente.estado, loja.nomeloja, loja.uf
	FROM compras
JOIN cliente ON compras.idcliente = cliente.idcliente
JOIN loja ON compras.idloja = loja.idloja;

-- INNER JOIN

SELECT produto.nomeproduto, produto.preco, marca.nomemarca
	FROM produto INNER JOIN marca
ON produto.idmarca = marca.idmarca;

-- LEFT JOIN

SELECT cliente.nomecliente, compras.idcompra
	FROM cliente LEFT JOIN compras
ON cliente.idcliente = compras.idcliente;




----------------------------

-- Use COUNT para contar ocorrências.
-- Use SUM para somar valores numéricos.



--MAX

SELECT MAX(preco)
	FROM produto;

--MIN

SELECT MIN(qtd)
	FROM compras;

--AVG

SELECT (AVG(qtd),2)
	FROM compras;

--AVG

SELECT AVG(qtd)
	FROM compras;

-- COUNT

SELECT COUNT(*)
	FROM cliente
WHERE estado = 'Rio de Janeiro';

-- AVG

SELECT AVG(preco)
	FROM produto;

-- SUM

SELECT SUM(compra.qtd)
	FROM compras
JOIN produto ON produto.idproduto = compras.idproduto
JOIN marca ON produto.idmarca = marca.idmarca
	WHERE nomemarca = 'Bom Prato';

-- SUM

SELECT SUM(c.qtd)
	FROM compras AS c JOIN loja AS lj
ON c.idloja = lj.idloja
	WHERE nomeloja = 'Vale Verde';

-- COUNT GROUP BY

SELECT COUNT(*), estado
	FROM cliente
GROUP BY estado
ORDER BY count DESC;

SELECT estado, COUNT(*) as totclientes 
  FROM cliente
 GROUP BY estado
 ORDER BY totclientes DESC; 

-- 

SELECT COUNT(*), uf
	FROM loja 
GROUP BY uf;

SELECT COUNT(*) as qtd, uf
	FROM loja 
GROUP BY uf
ORDER BY qtd DESC;

-- 

SELECT COUNT(*), idmarca
	FROM produto
GROUP BY idmarca;

SELECT COUNT(*) as qtd, idmarca
	FROM produto
GROUP BY idmarca
ORDER BY qtd DESC;

-- SUM

SELECT m.nomemarca, SUM(c.qtd*p.preco) AS total
	FROM compras AS c
JOIN produto AS p ON c.idproduto = p.idproduto
JOIN marca AS m ON m.idmarca = p.idmarca
	GROUP BY m.nomemarca
	ORDER BY total DESC;

-- AVG

SELECT AVG(c.qtd), p.nomeproduto
	FROM compras AS c JOIN produto AS p
ON c.idproduto = p.idproduto
GROUP BY nomeproduto;

-- SUM

SELECT SUM(c.qtd), p.nomeproduto
	FROM compras AS c JOIN produto AS p
ON c.idproduto = p.idproduto
GROUP BY nomeproduto;

-- SUM

SELECT SUM(cp.qtd) as qtdT, c.nomecliente
	FROM compras AS cp JOIN cliente AS c
ON cp.idcliente = c.idcliente
	GROUP BY nomecliente
	ORDER BY qtdT DESC;

-- COUNT

	SELECT pr.idproduto, co.idcliente, COUNT(*) AS tot
  FROM compras AS co 
  JOIN produto AS pr
    ON co.idproduto = pr.idproduto
 GROUP BY pr.idproduto, co.idcliente
 ORDER BY pr.idproduto, co.idcliente;

-- COUNT

SELECT cidade, COUNT(*) AS total
	FROM cliente
GROUP BY cidade
ORDER BY total DESC
LIMIT 5;

-- SUM
SELECT p.nomeproduto, SUM(qtd) AS total
  FROM compras AS c
  JOIN produto AS p ON c.idproduto = p.idproduto
 GROUP BY p.nomeproduto
 ORDER BY total DESC;	


-- COUNT

 SELECT p.nomeproduto, COUNT(qtd) AS total
  FROM compras AS c
  JOIN produto AS p ON c.idproduto = p.idproduto
 GROUP BY p.nomeproduto
 ORDER BY total DESC;	

 -- SUM

 SELECT co.idcliente, SUM(pr.preco*co.qtd) AS tot
  FROM compras AS co
  JOIN produto AS pr
    ON co.idproduto = pr.idproduto
 GROUP BY co.idcliente
 ORDER BY tot DESC
 LIMIT 5;

-- HAVING

SELECT estado, COUNT(*)
	FROM cliente
GROUP BY estado
HAVING COUNT(*) > 50
ORDER BY count DESC;

--

SELECT m.nomemarca, SUM(p.preco*c.qtd) AS total
	FROM produto AS p
JOIN compras AS c ON p.idproduto = c.idproduto
JOIN marca AS m ON p.idmarca = m.idmarca
GROUP BY m.nomemarca
HAVING SUM(p.preco*c.qtd) > 25000.00
ORDER BY total DESC;

-- 

SELECT c.nomecliente, COUNT(cp.qtd) AS total
	FROM cliente AS c JOIN compras AS cp
ON c.idcliente = cp.idcliente
GROUP BY c.nomecliente
HAVING COUNT(cp.qtd) < 5
ORDER BY total DESC;










	
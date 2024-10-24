-- SELECT * FROM produto;
-- SELECT * FROM marca;

-- SELECT nomeproduto, nomemarca
-- 	FROM produto, marca
-- WHERE produto.idmarca = marca.idmarca
-- 	AND nomemarca = 'Bom Prato';

SELECT cliente.idcliente, nomecliente, idcompra, idproduto, dtcompra, nomeloja, qtd
	FROM cliente, compras, loja
WHERE cliente.idcliente = compras.idcliente
	AND compras.idloja = loja.idloja;
	
	


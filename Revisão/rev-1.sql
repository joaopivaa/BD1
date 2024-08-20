SELECT cnpj, razaoSocial, endereco, nome FROM fornecedor
INNER JOIN cidade ON cidade.idCidade = fornecedor.idCidade;

SELECT cnpj, razaoSocial, endereco, nome cidade FROM fornecedor, cidade
WHERE cidade.idCidade = fornecedor.idCidade;

SELECT cl.nome, endereco, cd.nome cidade FROM cliente cl
LEFT JOIN cidade cd ON cd.idCidade = cl.idCidade;

SELECT codigo, cl.nome, endereco, cd.nome cidade FROM cliente
LEFT JOIN cidade cd ON cd.idCidade = cl.idCidade
WHERE cl.nome LIKE '%Santos%' ;

SELECT cl.nome, SUM(i.qtde * p.valor) as 'Valor nota' FROM cliente cl
JOIN nota n ON n.codigoCliente = cl.codigo
JOIN item i ON i.numero_nota = n.numero
JOIN produto p ON p.codigo = i.codigo_produto
GROUP BY cl.nome ORDER BY 'Valor Nota' ;
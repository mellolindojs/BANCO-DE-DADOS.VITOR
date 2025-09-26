--exercicio 1
SELECT produto, data_venda FROM VENDAS
WHERE vendedor = 'Ana'
ORDER BY data_venda DESC;

--exercicio 2
SELECT SUM(valor) AS total_valor FROM VENDAS
WHERE categoria = 'Eletrônicos';
--exercicio 3
SELECT produto, valor FROM VENDAS
    WHERE valor >= 200 AND valor < 1000;

--200 e 1000
--exercicio 4
SELECT 
   vendedor,
   COUNT(vendedor) AS qtd_vendas,
   SUM(valor) AS receita_total
FROM VENDAS
GROUP BY vendedor
ORDER BY receita_total DESC;

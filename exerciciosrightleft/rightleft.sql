SELECT 
    c.nome AS nome_cliente,
    v.produto AS produto_vendido
FROM 
    CLIENTES c
LEFT OUTER JOIN 
    VENDAS  v
    ON v.id_cliente = c.id_cliente;

SELECT
    COALESCE(c.nome, 'Sem Cliente') AS cliente,
    v.produto,
    v.valor
FROM VENDAS v
LEFT JOIN CLIENTES c
    ON v.id_cliente = c.id_cliente;

SELECT
    c.nome,
    c.cidade
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente
WHERE v.id IS NULL;

SELECT
    c.cidade,
    NVL(SUM(v.valor), 0) AS total_vendas
FROM CLIENTES c
LEFT JOIN VENDAS v
    ON c.id_cliente = v.id_cliente
GROUP BY c.cidade;


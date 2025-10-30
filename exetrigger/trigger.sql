CREATE OR REPLACE TRIGGER trg_log_update_vendas
AFTER UPDATE ON vendas
FOR EACH ROW
BEGIN
    INSERT INTO log_vendas (operacao, id_venda, produto, vendedor, valor, observacao)
    VALUES (
        'UPDATE',
        :NEW.id,
        :NEW.produto,
        :NEW.vendedor,
        :NEW.valor,
        'Registro atualizado'
    );
END;
/
CREATE OR REPLACE PROCEDURE total_vendas_vendedor (
    p_vendedor IN  VARCHAR2,
    p_total    OUT NUMBER
)
AS
BEGIN
    SELECT NVL(SUM(valor), 0)
    INTO p_total
    FROM vendas
    WHERE UPPER(vendedor) = UPPER(p_vendedor);
END;
CREATE OR REPLACE TRIGGER trg_valida_valor_venda
BEFORE INSERT ON vendas
FOR EACH ROW
BEGIN
    IF :NEW.valor <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O valor da venda deve ser maior que zero.');
    END IF;
END;
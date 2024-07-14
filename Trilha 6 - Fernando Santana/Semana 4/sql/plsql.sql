-- Tarefa 1 --

CREATE OR REPLACE PROCEDURE brh.insere_projeto (
    nome_projeto VARCHAR2,
    responsavel_projeto VARCHAR2
)
AS BEGIN
-- Tarefa 4 (verifica nome) --
    IF LENGTH(nome_projeto) < 2 OR nome_projeto IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Nome de projeto inválido! Deve ter dois ou mais caracteres.');
    END IF;

    INSERT INTO brh.projeto (nome_projeto, responsavel_projeto)
    VALUES (nome_projeto, responsavel_projeto);
    COMMIT;
END;


-- Tarefa 2 --

CREATE OR REPLACE FUNCTION brh.calcula_idade(data DATE)
RETURN NUMBER IS idade NUMBER;
BEGIN
    -- Verifica se a data é válida --
    IF data IS NULL OR data > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Impossível calcular idade! Data inválida: ' || TO_CHAR(data, 'DD/MM/YYYY'));
    END IF;

    -- Calcular a idade --
    SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, data) / 12)
    INTO idade
    FROM dual;
    RETURN idade;
END;


-- Tarefa 4 --

CREATE OR REPLACE FUNCTION brh.finaliza_projeto(p_id_projeto NUMBER)
RETURN DATE
IS data_final DATE;
BEGIN data_final := SYSDATE;
   
    UPDATE brh.projeto
    SET data_fim = data_final
    WHERE id_projeto = p_id_projeto;
    RETURN data_final;
END;




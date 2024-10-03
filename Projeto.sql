DELIMITER $$

CREATE PROCEDURE Preencherprojeto()
BEGIN
    TRUNCATE TABLE projeto;

    INSERT INTO projeto (BAIRRO, Ano, Quadrimestre, Quantidade)
    SELECT
        BAIRRO,
        YEAR(Data) AS Ano,
        CASE
            WHEN MONTH(Data) BETWEEN 1 AND 4 THEN 1
            WHEN MONTH(Data) BETWEEN 5 AND 8 THEN 2
            WHEN MONTH(Data) BETWEEN 9 AND 12 THEN 3
        END AS Quadrimestre,
        COUNT(*) AS Quantidade
    FROM acidentes
    GROUP BY BAIRRO, Ano, Quadrimestre;
END $$

DELIMITER ;
-- 04) (Frodo) Listar todos os eventos em ordem decrescente de lucro por venda de ingressos
    -- ORDER BY/ATRIBUTOS DERIVADOS IMPLÍCITOS (LUCRO)
    
SELECT e.id_evento, e.lugar, e.data, SUM(ti.preco) AS "FATURAMENTO" FROM evento e
    JOIN tipo_ingresso ti ON e.id_evento = ti.id_evento
    JOIN ingresso i ON ti.tipo = i.tipo_ingresso AND ti.id_evento = i.id_evento
GROUP BY e.id_evento, e.lugar, e.data
ORDER BY SUM(ti.preco) DESC;

-- 10) (Frodo) Buscar os eventos que venderam menos ingressos que a média dos ingressos vendidos dos eventos que ocorreram no mesmo lugar.
    -- Group By, aninhada correlacionada
SELECT e.id_evento, e.data, e.lugar, i.NUMERO_INGRESSOS FROM evento e
JOIN
    (SELECT ing.id_evento, COUNT(*) AS NUMERO_INGRESSOS FROM ingresso ing
        GROUP BY ing.id_evento) i ON e.id_evento = i.id_evento
JOIN
    (SELECT LUGAR, (COUNT(*)/COUNT(DISTINCT E2.ID_EVENTO)) AS NUMERO_MEDIO_INGRESSOS FROM EVENTO E2
            JOIN INGRESSO ON E2.ID_EVENTO = INGRESSO.ID_EVENTO
        GROUP BY LUGAR) lmi ON e.lugar = lmi.lugar
WHERE i.NUMERO_INGRESSOS < lmi.NUMERO_MEDIO_INGRESSOS;
SELECT
    A.*,
    D.uuid
FROM
    tim_lend_loans A
INNER JOIN
    tim_lend_users B ON A.tim_lend_user_id = B.id
INNER JOIN
    tim_users C ON B.tim_user_id = C.id
LEFT OUTER JOIN
    msisdn_lookup D ON C.msisdn = D.msisdn
    AND D.start_date <= C.created_at + INTERVAL ‘2 seconds’
    AND C.created_at + INTERVAL ‘2 seconds’ <= COALESCE(D.end_date, ‘2024-09-03T23:59:59’)
WHERE
    A.updated_at >= ‘2024-09-02T00:00:00’
    AND C.msisdn IN (‘5519982053014’); -- Inserir aqui a lista de MSISDNs
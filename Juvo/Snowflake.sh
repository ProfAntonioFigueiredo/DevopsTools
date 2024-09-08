from DBT_DATABASE_PRODUCTION.COMMON.DIM_LOANS l

LEFT JOIN "DBT_DATABASE_PRODUCTION"."COMMON"."DIM_SUBSCRIBERS" s
on s.uuid = l.uuid
and s.telco_id = l.telco_id


where l.telco_id = 'TIM'
and l.lender = 'Juvo'
and l.issued_date >= '2024-08-01'
--and l.amount > 5
-- and l.channel = 'URA SEM SALDO'
and l.channel = 'CAPTIVE PORTAL'

[{"category":"credit","title":"Credit","products":[{"id":"18015-1","status":"active","amount":15.0,"fee":5.0,"currency":"BRL","title":"R$15,00 de crédito + R$5,00 de taxa","dialog_text":"Pague R$20,00 até 25/09/24 para ganhar pontos.","payback_date":"2024-09-25T23:59:59Z","description":"R$20,00","validity_days":10,"validity_date":"2024-09-05T23:59:59Z","confirmation_text":"Obrigado, o seu empréstimo foi adicionado à sua conta. Recarregue no mínimo R$15,00 até 25/09/2024 para pagar."},{"id":"18014-1","status":"active","amount":10.0,"fee":3.5,"currency":"BRL","title":"R$10,00 de crédito + R$3,50 de taxa","dialog_text":"Pague R$13,50 até 25/09/24 para ganhar pontos.","payback_date":"2024-09-25T23:59:59Z","description":"R$13,50","validity_days":10,"validity_date":"2024-09-05T23:59:59Z","confirmation_text":"Obrigado, o seu empréstimo foi adicionado à sua conta. Recarregue no mínimo R$10,00 até 25/09/2024 para pagar."},{"id":"18013-1","status":"active","amount":5.0,"fee":2.0,"currency":"BRL","title":"R$5,00 de crédito + R$2,00 de taxa","dialog_text":"Pague R$7,00 até 25/09/24 para ganhar pontos.","payback_date":"2024-09-25T23:59:59Z","description":"R$7,00","validity_days":5,"validity_date":"2024-08-31T23:59:59Z","confirmation_text":"Obrigado, o seu empréstimo foi adicionado à sua conta. Recarregue no mínimo R$5,00 até 25/09/2024 para pagar."}]}]

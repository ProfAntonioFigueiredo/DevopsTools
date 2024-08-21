
# Lista de MSISDNs
msisdns = [
    "5591981300713",
    "5511954870517",
    "5531991837284",
    "5541999556083",
    # Adicione mais números aqui
]

# Crie uma lista de listas onde cada sublista contém o MSISDN e a data correspondente
data = [[msisdn, pd.to_datetime("2024-08-16")] for msisdn in msisdns]

# Crie o DataFrame com os números e as datas
df_to_match_csv = pd.DataFrame(data, columns=["nr_celular", "safra"])

# Aplicar a função de anonimização
with_uuid = anonymize_backtest('tim', df_to_match_csv, ref_name='safra', msisdn_name='nr_celular', hashed=True)

# Exibir o resultado
with_uuid
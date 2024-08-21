import requests # type: ignore
import pandas as pd # type: ignore

# Função para fazer a requisição à API e retornar a resposta JSON
def get_products(msisdn):
    url = 'https://api-internal.juvotimbrazil.com/tim/products'
    headers = {
        'Api-Version': '4',
        'Msisdn': msisdn,
        'Package': 'tim.lend.br',
        'Authorization': 'Basic ZjlDQkRlaERMQm1EYnhkcGpEUmZxVWRXOnpoeENGSm1CbzdNb2NrTUp6TEFCY0F3Tg=='
    }
    response = requests.get(url, headers=headers)
    return response.json()

# Lista de MSISDNs para consulta
msisdns = [
    '5591981300713',
    # Adicione mais MSISDNs aqui
]

# Lista para armazenar os dados
data = []

# Itera sobre cada MSISDN e coleta os dados
for msisdn in msisdns:
    products_data = get_products(msisdn)
    for category in products_data:
        for product in category['products']:
            data.append({
                'MSISDN': msisdn,
                'Category': category['category'],
                'Title': product['title'],
                'Status': product['status'],
                'Description': product['description'],
                'Payback Date': product['payback_date'],
                'Amount': product['amount'],
                'Fee': product['fee'],
                'Points': product['points']
            })

# Cria um DataFrame e salva em CSV
df = pd.DataFrame(data)
df.to_csv('products.csv', index=False)


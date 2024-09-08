#!/bin/bash

# Caminho para o arquivo de MSISDNs
msisdn_file="msisdns.txt"
output_file="resultado.csv"

# Cria o arquivo CSV e adiciona o cabeçalho
echo "msisdn,resposta" > "$output_file"

# Loop para cada MSISDN no arquivo
while IFS= read -r msisdn; do
  # Executa o comando curl e salva o resultado temporariamente
  response=$(curl --silent --location --request GET 'https://api-internal.juvotimbrazil.com/tim/ussd/products' \
  --header "Api-Version: 4" \
  --header "Msisdn: $msisdn" \
  --header "Package: tim.lend.br" \
  --header 'Authorization: Basic ZjlDQkRlaERMQm1EYnhkcGpEUmZxVWRXOnpoeENGSm1CbzdNb2NrTUp6TEFCY0F3Tg==')

  # Extrai a resposta dentro da tag <p> usando sed
  resposta=$(echo "$response" | sed -n 's/.*<p>\(.*\)<\/p>.*/\1/p')

  # Remove quebras de linha da resposta, se necessário
  resposta=$(echo "$resposta" | tr '\n' ' ')

  # Grava no arquivo CSV
  echo "$msisdn,\"$resposta\"" >> "$output_file"

  # Exibe a resposta completa
  echo "Resposta para MSISDN $msisdn: $resposta"
  echo "-----------------------------------"

  # Adicione um delay se necessário para evitar sobrecarga
  sleep 1
done < "$msisdn_file"


az vm list-ip-addresses --name myVM --resource-group learn-1bb7f8d1-b06e-4a77-9005-017fe7ad2288 --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" --output tsv




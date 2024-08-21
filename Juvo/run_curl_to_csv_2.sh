#!/bin/bash

# Caminho para o arquivo de MSISDNs
msisdn_file="msisdns.txt"

# Loop para cada MSISDN no arquivo
while IFS= read -r msisdn; do
  # Executa o comando curl e salva o resultado temporariamente
  response=$(curl --location --request GET 'https://api-internal.juvotimbrazil.com/tim/ussd/products' \
  --header "Api-Version: 4" \
  --header "Msisdn: $msisdn" \
  --header "Package: tim.lend.br" \
  --header 'Authorization: Basic ZjlDQkRlaERMQm1EYnhkcGpEUmZxVWRXOnpoeENGSm1CbzdNb2NrTUp6TEFCY0F3Tg==')

  # Exibe a resposta completa
  echo "Resposta para MSISDN $msisdn:"
  echo "$response"
  echo "-----------------------------------"

  # Adicione um delay se necessário para evitar sobrecarga
  sleep 1
done < "$msisdn_file"

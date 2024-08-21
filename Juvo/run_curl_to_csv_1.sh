#!/bin/bash

# Caminho para o arquivo de MSISDNs
msisdn_file="msisdns.txt"

# Arquivo de saída em formato CSV
output_file="output.csv"

# Limpa o arquivo de saída antes de começar
> "$output_file"

# Adiciona o cabeçalho da tabela no arquivo CSV
echo "MSISDN,Campo1,Campo2,Campo3" >> "$output_file"  # Substitua Campo1, Campo2, etc. pelos nomes reais dos campos

# Loop para cada MSISDN no arquivo
while IFS= read -r msisdn; do
  # Executa o comando curl e salva o resultado temporariamente
  response=$(curl --location --request GET 'https://api-internal.juvotimbrazil.com/tim/products' \
  --header "Api-Version: 4" \
  --header "Msisdn: $msisdn" \
  --header "Package: tim.lend.br" \
  --header 'Authorization: Basic ZjlDQkRlaERMQm1EYnhkcGpEUmZxVWRXOnpoeENGSm1CbzdNb2NrTUp6TEFCY0F3Tg==')

  # Extrai os dados relevantes do HTML usando sed
  campo1=$(echo "$response" | sed -n 's:.*<tag_campo1>\(.*\)</tag_campo1>.*:\1:p')
  campo2=$(echo "$response" | sed -n 's:.*<tag_campo2>\(.*\)</tag_campo2>.*:\1:p')
  campo3=$(echo "$response" | sed -n 's:.*<tag_campo3>\(.*\)</tag_campo3>.*:\1:p')

  # Adiciona os dados extraídos no arquivo CSV
  echo "$msisdn,$campo1,$campo2,$campo3" >> "$output_file"

  # Adicione um delay se necessário para evitar sobrecarga
  sleep 1
done < "$msisdn_file"

echo "Todos os resultados foram salvos em $output_file."
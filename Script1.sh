#!/bin/bash

# Verifica se o Azure CLI está instalado
if ! command -v az &> /dev/null
then
    echo "Azure CLI não encontrado. Por favor, instale o Azure CLI para continuar."
    exit 1
fi

# Faz login no Azure
echo "Fazendo login no Azure..."
az login

# Nome do arquivo de saída
output_file="azure_subscriptions_info.txt"

# Limpa o conteúdo do arquivo de saída se já existir
> "$output_file"

# Obtém a lista de subscrições
subscriptions=$(az account list --query "[].{name:name, id:id}" --output tsv)

# Percorre cada subscrição
while IFS=$'\t' read -r subscription_name subscription_id
do
    echo "------------------------------------" | tee -a "$output_file"
    echo "Subscription Name: $subscription_name" | tee -a "$output_file"
    echo "Subscription ID: $subscription_id" | tee -a "$output_file"

    # Define a subscrição ativa
    az account set --subscription $subscription_id

    # Obtém grupos de recursos
    resource_groups=$(az group list --query "[].name" --output tsv)
    
    echo "Resource Groups:" | tee -a "$output_file"

    # Percorre cada grupo de recursos
    while IFS= read -r rg
    do
        echo "  - $rg" | tee -a "$output_file"

        # Obtém as máquinas virtuais em cada grupo de recursos
        vms=$(az vm list --resource-group "$rg" --query "[].{name:name}" --output tsv)
        
        if [ -z "$vms" ]; then
            echo "    Sem máquinas virtuais no grupo de recursos $rg" | tee -a "$output_file"
        else
            echo "    Virtual Machines in Resource Group $rg:" | tee -a "$output_file"
            while IFS= read -r vm
            do
                echo "      - $vm" | tee -a "$output_file"
            done <<< "$vms"
        fi
    done <<< "$resource_groups"

    echo "------------------------------------" | tee -a "$output_file"
done <<< "$subscriptions"

echo "Informações salvas em $output_file"
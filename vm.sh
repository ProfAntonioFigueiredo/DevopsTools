# Criar o grupo de recursos
az group create \
    --name rg-devops-vmwin11 \
    --location brazilsouth

# Criar a VM com Windows 11
az vm create \
    --resource-group rg-devops-win11 \
    --name vm-windows11 \
    --image MicrosoftWindowsDesktop:windows-11:win11-22h2-pro:latest \
    --size Standard_B2s \
    --vnet-name nnet-devops-win11 \
    --nsg nsgsr-devops-win11 \
    --public-ip-address pip-devops-win11 \
    --authentication-type password \
    --admin-username admwin \
    --admin-password Fiap@2tds2024


# Criar o grupo de recursos
az group create --name rg-bcosql-pf1776-001 --location brazilsouth

# Criar o Servidor SQL:​
az sql server create -l brazilsouth -g rg-bcosql-pf1776-001 -n sqlserver-pf1776-001 -u admsql -p devops@Fiap2tds --enable-public-network true

# Criar o Banco SQL:​
az sql db create -g rg-bcosql-pf1776-001 -s sqlserver-pf1776-001 -n 2tds-dev-pf1776-001 --service-objective Basic --backup-storage-redundancy Local --zone-redundant false

# Criar uma regra para deixar todos os IPs acessarem seu Banco:​
az sql server firewall-rule create -g rg-bcosql-pf1776-001 -s sqlserver-pf1776-001 -n AllowAll --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

Download and install Azure Data Studio
https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=win-install%2Cwin-user-install%2Credhat-install%2Cwindows-uninstall%2Credhat-uninstall


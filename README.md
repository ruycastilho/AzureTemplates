# Templates for Azure VMs

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/ruycastilho/AzureTemplates/master/azuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/ruycastilho/AzureTemplates/master/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Template that contemplates VMs:
* with or without GPUs
* with Singularity installed

The default configuration is:
VM size:
* Standard_A8

Storage:
* Standard_LRS

It is possible to change the configurations by using the following parameters:
* vmSize -> type of VM instance
* storageAccountType -> type of storage account

Supported VM sizes:
* Standard_A8 (No GPU)
* Standard_NC6 (GPU enabled)

(The availability changes depending on the region selected for the deployment - Default West US 2 includes all supported sizes)

Command:
az group create --name <ResourceGroupName> --location "West US 2"
az group deployment create \
    --name <VMname> \
    --resource-group <ResourceGroupName> \
    --template-uri "https://raw.githubusercontent.com/ruycastilho/AzureTemplates/master/azuredeploy.json"
    --parameters storageAccountType=Standard_GRS vmSize=Standard_A8
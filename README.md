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
* ..

Storage:
* ..

It is possible to change the configurations by using the following parameters:
* vmSize -> type of VM instance
* ..

Supported VM sizes:
* ..
* ..
* ..


(The availability changes depending on the region selected for the deployment)

Command:
az group create --name Name --location "South Central US"
az group deployment create \
    --name SingularityTest \
    --resource-group ResourceGroupTest \
    --template-uri "https://raw.githubusercontent.com/ruycastilho/AzureTemplates/master/azuredeploy.json"
    --parameters storageAccountType=Standard_GRS vmSize=Standard_A8
metadata description = 'Creates a storage account and a web app'

targetScope = 'resourceGroup'
//resourceGroup	Resources inside RG
//subscription	Resource Groups / Policies
//managementGroup	Org governance
//tenant	Entra ID level

param location string = resourceGroup().location
param storageAccountName string = 'st${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}

module webModule '../module/webapp.bicep' = {
  name: 'webDeploy'
  params: {
   
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name

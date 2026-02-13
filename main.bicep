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

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name

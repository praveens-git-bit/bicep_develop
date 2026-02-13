// ---------------- PARAMETERS ----------------
param appName string = 'demoapp'
param location string = resourceGroup().location
param skuName string = 'B1'

// ---------------- VARIABLES ----------------
var planName = '${appName}-plan'
var webAppName = '${appName}-${uniqueString(resourceGroup().id)}'

// ---------------- APP SERVICE PLAN ----------------
resource servicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: planName
  location: location
  sku: {
    name: skuName
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

// ---------------- WEB APP ----------------
resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: servicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
    }
    httpsOnly: true
  }
}

// ---------------- OUTPUT ----------------
output websiteURL string = 'https://${webApp.properties.defaultHostName}'

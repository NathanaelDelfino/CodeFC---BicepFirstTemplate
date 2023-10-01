@allowed([
  'nonprod'
 'prod'
])
param environmentType string 

//Variavel que definira a localização do recurso
param location string = 'westus3'

var storageAccountNameSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'


param storageAccountName string =  'codefc${uniqueString(resourceGroup().id)}'

param AppServiceAppName string = 'codefc-toy-produtct-launch-2'
var AppServicePlanName  = 'codefc-toy-product-launch-plan-starter'



resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountNameSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: AppServicePlanName
  location: location
  sku:{
    name: appServicePlanSkuName
  }
}

resource appServiceapp 'Microsoft.Web/sites@2022-03-01' = {
  name: AppServiceAppName
  location: location
  properties:{
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

param storageAccountName string = uniqueString(resourceGroup().id)


param AppServiceAppName string = 'codefc-toy-produtct-launch-1'
var AppServicePlanName  = 'toy-product-launch-plan-starter'
param AppStorageAccountName string = 'codefcmyfirsttemplate'

//Variavel que definira a localização do recurso
param location string = resourceGroup().location



resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: AppStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
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
    name:'F1'
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

param AppServiceAppName string = 'codefc-toy-produtct-launch-1'
var AppServicePlanName  = 'toy-product-launch-plan-starter'
param AppStorageAccountName string = 'codefcmyfirsttemplate'



resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: AppStorageAccountName
  location: 'westus3'
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
  location: 'westus3'
  sku:{
    name:'F1'
  }
}

resource appServiceapp 'Microsoft.Web/sites@2022-03-01' = {
  name: AppServiceAppName
  location: 'westus3'
  properties:{
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

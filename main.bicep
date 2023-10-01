resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'codefcmyfirsttemplate'
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
  name: 'toy-product-launch-plan-starter'
  location: 'westus3'
  sku:{
    name:'F1'
  }
}

resource appServiceapp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'codefc-toy-produtct-launch-1'
  location: 'westus3'
  properties:{
    serverFarmId: appServicePlan.id
    httpOnly: true
  }
}

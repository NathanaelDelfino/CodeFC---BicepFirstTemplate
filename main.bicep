@allowed([
  'nonprod'
 'prod'
])
param environmentType string 

//Variavel que definira a localização do recurso
param location string = 'westus3'

var storageAccountNameSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'



param storageAccountName string =  'codefc${uniqueString(resourceGroup().id)}'
param AppServiceAppName string = 'codefc-${uniqueString(resourceGroup().id)}'

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


module appService 'modules/appService.bicep' ={
  name: 'appService'
  params:{
    location: location
    appServiceAppName: AppServiceAppName
    environmentType: environmentType
  } 
}

output appServiceAppHostName string = appService.outputs.appServiceAppHostName

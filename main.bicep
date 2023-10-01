resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'codefcmyfirsttemplate'
  location: 'westus3'
  sku: {
    name: 'F1'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


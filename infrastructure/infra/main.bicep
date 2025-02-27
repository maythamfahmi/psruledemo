targetScope = 'subscription'

param environment string
param location string
param owner string

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: 'rg-demo-ps-rule-${environment}'
  location: location
  tags: {
    Owner: owner
  }
}

module storageAccountRaw './modules/storageAccountWithBlob.bicep' = {
  name: 'storage-raw-deployment'
  scope: rg
  params: {
    storageAccountName: 'sademopsruleraw${environment}'
    blobContainerName: 'default'
    location: location
  }
}

output environment string = environment

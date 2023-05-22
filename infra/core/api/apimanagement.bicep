param name string
param location string = resourceGroup().location
param tags object = {}

param publisherEmail string
param publisherName string

@allowed([
  'Developer'
  'Standard'
  'Premium'
])
param sku string = 'Developer'


@allowed([
  1
  2
])
param skuCount int = 1


resource apiManagementService 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: sku
    capacity: skuCount
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}

#!/bin/bash

# Variables
subscriptionId="b840382c-ee0b-4177-bc4a-293e87169f7a"
spName="gh-access-sp"
resourceGroupName="fstates"
storageAccountName="bhstskstf"
containerName="tfstatedevops"
location="uksouth"
sku="Standard_LRS"

# Retrieve the Object ID of the service principal
principalId=$(az ad sp list --display-name "$spName" --query '[].id' -o tsv)

# Assign Contributor role to the service principal
az role assignment create --assignee-object-id "$principalId" --role Contributor --scope "/subscriptions/$subscriptionId"

# Output information about the service principal
echo "Service principal created:"
echo "Name: $spName"
echo "Subscription ID: $subscriptionId"

# Create Resource Group
az group create --name "$resourceGroupName" --location "$location"
 
# Create Storage Account
az storage account create --name "$storageAccountName" --resource-group "$resourceGroupName" --location "$location" --sku "$sku"
 
# Create Storage Account Container
az storage container create --name "$containerName" --account-name "$storageAccountName"

#test

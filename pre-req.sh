# Variables
subscriptionId="b840382c-ee0b-4177-bc4a-293e87169f7a"
spName="gh-access-sp"

# Retrieve the Object ID of the service principal
$principalId = $(az ad sp list --display-name $spName --query '[].id' -o tsv)

az role assignment create --assignee-object-id $principalId --role Contributor --scope /subscriptions/$subscriptionId


# Output the necessary information
echo "Service principal created:"
echo "Name: $spName"
echo "Subscription ID: $subscriptionId"

# Your backend lives here

The folder named "azurecosmosdb-terraform" is used to build the CosmosDB in Azure
This was done to help learn how to use terraform for building CosmosDB since I knew I would have to tear it down
alot until I was able to work on it again.

# What to update on the main.tf file to use the code
- subscription_id "Use your own Azure subscription id"
- Tags "You can change these. But its good to use Tags so you know what resources were built with terraform"
- Any of the terraform varaibles can be updated in the variables.tf file

# Manual step needed
- Add CosmoDB container Item in the Azure portal
- Reference link - https://youtu.be/ieYrBWmkfno?t=1751

# Improvements
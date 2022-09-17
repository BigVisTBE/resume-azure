# Your API lives here

# Manual step needed
- Item would already need to be added to container for the api to be successful
- Reference link - https://youtu.be/ieYrBWmkfno?t=1751

## Notes:
- When I created the function locally I got the option to use Azure Function version 4.0.1(Recommended). Then I chose .Net 6 as the next option
- When I ran the command "func host start" I got the error "error NU1100: Unable to resolve 'Microsoft.NET.Sdk.Functions (>= 4.1.1)' for 'net6.0'."
- This was resolved by adding nuget.org as a package source - https://stackoverflow.com/questions/61829713/nu1100unable-to-resolve-microsoft-net-sdk-functions-3-0-3-for-netcorea
- dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org
- Also had the add the following dependencies for the function
- "dotnet add package System.Configuration.ConfigurationManager --version 6.0.0"
- "dotnet add package Microsoft.Azure.WebJobs.Extensions.CosmosDB --version 3.0.10"

## Future improvements
- Learn how to create the inital item in the container with code. Terraform is not able to add an item to the 
database at this time but a issues was created for this - https://github.com/hashicorp/terraform-provider-azurerm/issues/9023
- Info on creating items in ComosDb - https://learn.microsoft.com/en-us/azure/cosmos-db/sql/quickstart-dotnet?tabs=azure-portal%2Cwindows

# Your API lives here

## Notes:
- When I created the function locally I got the option to use Azure Function version 4.0.1(Recommended). Then I chose .Net 6 as the next option
- When I ran the command "func host start" I got the error "error NU1100: Unable to resolve 'Microsoft.NET.Sdk.Functions (>= 4.1.1)' for 'net6.0'."
- This was resolved by adding nuget.org as a package source - https://stackoverflow.com/questions/61829713/nu1100unable-to-resolve-microsoft-net-sdk-functions-3-0-3-for-netcorea
- dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org
- Also had the add the following dependencies for the function
- "dotnet add package System.Configuration.ConfigurationManager --version 6.0.0"
- "dotnet add package Microsoft.Azure.WebJobs.Extensions.CosmosDB --version 3.0.10"

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "5f1257d4-c7e2-4396-9686-69a724a2ba45"
}

# Configure the Microsoft Azure resource group
resource "azurerm_resource_group" "azure-resume-rg" {
  name = var.rgname
  location = var.rglocation
  tags = {
    "ENV" = "dev"
    terraform = "true"
 }
}

# Configure the Microsoft Azure CosmoDB account
resource "azurerm_cosmosdb_account" "virg-azureresumedb" {
  name = var.cosmosdbaccountresume
  location = azurerm_resource_group.azure-resume-rg.location
  resource_group_name = azurerm_resource_group.azure-resume-rg.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location = azurerm_resource_group.azure-resume-rg.location
    failover_priority = 0
  }
  tags = {
    "ENV" = "dev"
    terraform = "true"
 }
}

# Configure the Microsoft Azure CosmoDB database
resource "azurerm_cosmosdb_sql_database" "db" {
  name = var.cosmosdbname
  resource_group_name = azurerm_resource_group.azure-resume-rg.name
  account_name = azurerm_cosmosdb_account.virg-azureresumedb.name
}

# Configure the Microsoft Azure CosmoDB container
resource "azurerm_cosmosdb_sql_container" "container" {
  name = var.cosmosdbcontainer
  resource_group_name = azurerm_resource_group.azure-resume-rg.name
  account_name = azurerm_cosmosdb_account.virg-azureresumedb.name
  database_name = azurerm_cosmosdb_sql_database.db.name
  partition_key_path = "/id"
}
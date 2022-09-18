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

resource "azurerm_storage_account" "saname" {
  name                     = var.saname
  resource_group_name      = var.rgname
  location                 = var.rglocation
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    "ENV" = "dev"
    terraform = "true"
    }
}

resource "azurerm_service_plan" "faserviceplanname" {
  name                = var.faserviceplanname
  location            = var.rglocation
  resource_group_name = var.rgname
  os_type             = "Linux"
  sku_name            = "Y1"
  tags = {
    "ENV" = "dev"
    terraform = "true"
  }
}

resource "azurerm_linux_function_app" "faname" {
  name                       = var.faname
  location                   = var.rglocation
  resource_group_name        = var.rgname
  service_plan_id            = azurerm_service_plan.faserviceplanname.id
  storage_account_name       = var.saname
  storage_account_access_key = azurerm_storage_account.saname.primary_access_key

  site_config {}

  tags = {
    "ENV" = "dev"
    terraform = "true"
  }
}

#After the infra is setup you will still need to add items manually.
#I haven't found a way to do it through terraform yet
# Link to the video abountcreating the item "https://youtu.be/ieYrBWmkfno?t=1758"
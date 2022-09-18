variable "rgname" {
  type = string
  default = "azure-resume-rg"
}

variable "rglocation" {
  type = string
  default = "East US"
}

variable "cosmosdbaccountresume" {
  type = string
  default = "v-azureresumedb"
}

variable "cosmosdbname" {
  type = string
  default = "resumedb"
}

variable "cosmosdbcontainer" {
    type = string
    default = "resumecounter"
}

variable "saname" {
  type = string
  default = "vhazureresumesa"
}

variable "faserviceplanname" {
    type = string
    default = "vhazureresumeapp"
}

variable "faname" {
    type = string
    default = "vhgetresumecounter"
}
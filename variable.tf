variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "name" {
  type        = string
  description = "Name of the postgresql_server"
}

variable "administrator_login" {
  type        = string
  description = "username of the azurerm_postgresql_server"
}


variable "sku_name" {
  type        = string
  description = "The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)"
}

variable "storage_mb" {
  type        = string
  description = "Max storage allowed for a server.values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 16777216 MB(16TB) for General Purpose/Memory Optimized SKUs. For more information see the product documentation."
}

variable "postgresql_version" {
  type        = string
  description = "The version of the postgressql"
}


variable "backup_retention_days" {
  type        = number
  description = "name of the resource group"
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "location of the resource group"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Name of the postgresql_server"
  default     = true
}

variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Name of the postgresql_server"
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  type        = string
  description = "password of the azurerm_postgresql_server"
  default     = "TLSEnforcementDisabled"
}

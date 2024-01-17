module "storage_account" {
  source = "git::https://github.com/myorg/terraform-azure-storage-account.git"

  storage_account_name  = "mystorageaccount"
  resource_group_name   = "myresourcegroup"
  location              = "eastus"
  account_tier          = "Standard"
  environment           = "dev"
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}

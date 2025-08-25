locals {
  comman_tags = {
    "enviroment" = "dev"
    "project"    = "mayapp"
    "owner"      = "dev-team"
    "managedby"  = "terraform"
  }
}


module "rg" {
  source      = "../../az_resource_group"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  tags        = local.comman_tags

}

module "sa" {
  depends_on  = [module.rg]
  source      = "../../az_storage_account"
  stg_name    = "myappdevst01"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  tags        = local.comman_tags
}

module "sqlserver" {
  depends_on  = [module.rg]
  source      = "../../az_sql_server"
  sql_name    = "myapp-dev-sql"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  admin_user  = "sqladmin"
  admin_pass  = "Tiger@jinda1"  
  tags        = local.comman_tags

}

module "sqldb" {
  depends_on = [module.sqlserver]
  source     = "../../az_sql_database"
  sqldb      = "myapp-dev-sqldb"
  server_id  = module.sqlserver.sql_server_id
  tags       = local.comman_tags

}

module "kv" {
  depends_on  = [module.rg]
  source      = "../../az_keyvault"
  kv_name     = "myapp-dev-kv"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  tags        = local.comman_tags

}

module "aks_cluster" {
  depends_on  = [module.rg]
  source      = "../../az_kubernates_cluster"
  aks_name    = "myapp-dev-aks"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  dns_prefix  = "myapp-dev-aks"
  tags        = local.comman_tags


}

module "acr" {
  depends_on  = [module.rg]
  source      = "../../az_acr"
  acr_name    = "myappdevacr"
  rg_name     = "myapp-dev-rg"
  rg_location = "central india"
  tags        = local.comman_tags


}
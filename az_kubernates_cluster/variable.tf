variable "aks_name" {
    type = string
}
variable "rg_name" {}
variable "rg_location" {}
variable "tags" {
    type = map(string)  
  
}
variable "dns_prefix" {}
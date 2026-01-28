locals {
  dobles_map = {for key,value in var.number_map: key => value}
  even_map = { for key,value in var.number_map: key => value *2 if value % 2 == 0 }
}

output "double_map" {
    value = local.dobles_map
}

output "even_map" {
    value = local.even_map
}
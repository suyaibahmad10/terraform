locals {
  # iterating over a list to create a new list with each number doubled
  double_numbers = [for num in var.number_list : num * 2]
  even_numbers   = [for num in var.number_list : num if num % 2 == 0]

  firstnames = [for person in var.maps_list : person.firstname]
  fullnames = [
    for name in var.maps_list : "${name.firstname} ${name.lastname}"
  ]
}

output "double_numbers" {
  value = local.double_numbers
}

output "even_numbers" {
  value = local.even_numbers
}

output "firstname" {
  value = local.firstnames
}

output "fullnames" {
  value = local.fullnames
}
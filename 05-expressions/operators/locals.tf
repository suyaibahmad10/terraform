locals {
  math_operators = {
    addition       = 5 + 3
    subtraction    = 10 - 4
    multiplication = 6 * 7
    division       = 20 / 5
    modulus        = 10 % 3
  }
}

locals {
  # returns boolean values
  equality   = 2 == 2 # ==, !=
  comparison = 2 > 1  # >, <, >=, <=
  local      = !true  # !, &&, ||
}

output "math_operators" {
  value = local.math_operators
}

output "equality" {
  value = local.equality

}

output "comparison" {
  value = local.comparison
}

output "local" {
  value = local.local
}
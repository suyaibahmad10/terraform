variable "number_list" {
  type = list(number)
}

variable "maps_list" {
  type = list(object({
    firstname = string
    lastname  = string
  }))
}

variable "number_map" {
  type = map(number)
}
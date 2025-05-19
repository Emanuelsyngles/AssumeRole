variable "name" {
  type = string
  description = "this"
}

variable "description" {
  type = string
  description = "Descrição da policy"
  default     = "Managed by Terraform"
}

variable "statements" {
  type = list(object({
    Effect      = string
    Action      = list(string)
    resource    = string
  }))
  description = "Lista de statements da policy"
}
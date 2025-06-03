variable "thisrole" {
  type        = string
  description = "thisrole"
}

variable "assume_role_policy" {
    type = any
    description = "value"
}

variable "name" {
  type      = string
  description = "Nome base de recursos"
}

variable "policy_arn" {
  type = string
  description = "ARN da policy a ser anexada à role"
}
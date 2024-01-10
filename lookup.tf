variable "user_roles" {
  type    = map(string)
  default = {
    alice = "admin"
    bob   = "editor"
    charlie = "viewer"
  }
}
variable "default_role" {
  type    = string
  default = "guest"
}

locals {
  user_role_lookup = {
    alice   = lookup(var.user_roles, "alice", var.default_role)
    bob     = lookup(var.user_roles, "bob", var.default_role)
    david   = lookup(var.user_roles, "david", var.default_role)
  }
}

output "user_roles_result" {
  value = local.user_role_lookup
}

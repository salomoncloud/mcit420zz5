variable "simple_nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
variable "nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}

variable "nested_map" {
  type    = map(map(string))
  default = {
    group1 = {"name" = "Alice", "age" = "25"}
    group2 = {"name" = "Bob", "age" = "30"}
  }
}

locals{
  servicename="abracadabra"
  forum="abracadabramcit"
  lengthsa=length(local.servicename)
  lengthforum=length(local.forum)
  winterlistOfSports=["icehockey","snowboarding","iceskating"]
  winter_sports_message = length(local.winterlistOfSports) > 3 ? "Winter sports list is extensive" : "Winter sports list is limited"
  total_output = ["150", "150", "150"]
//==============================================Map example start===============================
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
  character_enemy_map =   { for index,character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed[index]
  }
//=============================================Map example end===============================
  simple_local_flattened_list = flatten(var.simple_nested_list)
  flattened_list = flatten(var.nested_list)
  flattened_map  = flatten([for k, v in var.nested_map : [for kk, vv in v : { group = k, key = kk, value = vv }]])
  sum_element1=20
  sum_element2=30
}

variable "total_output" {
  type    = list(string)
  default = ["150", "150", "150"]
}

locals {
  incremented_output = [
    for value in var.total_output : tostring(tonumber(value) + 10)
  ]
}
output "incremented_output_show" {
  value=local.incremented_output
}
output "winter_sports_message" {
  value = local.winter_sports_message
}

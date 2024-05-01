//==================================================1st May 2024=========================================//
variable "original_string" {
  default = "Montreal College Information Technology"
}

# Function 1: Length of the string
output "string_length" {
  value = length(var.original_string)
}

# Function 2: Uppercase the string
output "uppercase_string" {
  value = upper(var.original_string)
}

# Function 3: Lowercase the string
output "lowercase_string" {
  value = lower(var.original_string)
}

# Function 4: Replace "Hello" with "Hi"
output "replaced_string" {
  value = replace(var.original_string, "Montreal College Information Technology", "McGill University")
}

# Function 5: Concatenate with another string
variable "additional_string" {
  default = " from Terraform"
}

output "concatenated_string" {
  value = "${var.original_string}${var.additional_string}"
}

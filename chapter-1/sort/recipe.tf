# define an input variable of type string that contains an unordered list of strings that represent machine names
variable "machine_names" {
  type = list(string)
  description = "An unsorted list of machines that need sorting"
  default = ["tdolezal-D12BC45BFQ5P", "ksatirli-G41NH02BLT1L", "lninomae-T90TY75HMC4E"]
}

# use an output value to show a formatted list of machine names
output "sorted_machines" {
  description = "A formatted list of machines"
  value       = sort(var.machine_names)
}

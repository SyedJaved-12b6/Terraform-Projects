variable "project_name" {
  type = string
  description = "project name"
  default = "Project ALPHA Resources"
}

variable "default_tags" {
   type = map(string)
   default = {
     "company" = "TechCorp"
     "managed_by" = "terraform"
   }
}

variable "environment_tags" {
  type = map(string)
  default = {
    "environment" = "production"
    "cost_center" = "cc-123"
  }
}

variable "storage_account_name" {
  type = string
  default = "syedjstutoriaLS with!javedthis is should be formatted"
}

variable "allowed_ports" {
  type = string
  default = "80,443,3306"
}

variable "environment" {
   type = string
   description = "environment name"
   default = "dev"
   validation {
     condition = contains(["dev","staging","prod"], var.environment)
     error_message = "Enter the valid value for env:"
   }
  
}

variable "vm_sizes" {
   type = map(string)
   default = {
    dev     = "standard_D2s_v3",
    staging = "standard_D4s_v3",
    prod    = "standard_D8s_v3"
   }
  
}
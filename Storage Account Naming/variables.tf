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
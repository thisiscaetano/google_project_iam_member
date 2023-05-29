variable "project_id" {
  description = "lista de nomes do projeto"
  type        = list(string)
  default     = ["", ""]
}

variable "service_account_email" {
  default = ""
}

variable "role" {
  default = "roles/Editor"
}

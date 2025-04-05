variable "folder_name" {
  type      = string
}

variable "alert_name" {
  type      = string
}

variable "enable_alert" {
  type        = bool
  default     = false  # Defaults to "not created"
  description = "If true, creates the resource; if false, skips it."
}
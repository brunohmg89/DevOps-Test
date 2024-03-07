variable "cos_image_name" {
  description = "The forced COS image to use instead of latest"
  default     = "cos-stable-109-17800-147-22"
}

variable "client_email" {
  description = "Service account email address"
  type        = string
  default     = ""
}
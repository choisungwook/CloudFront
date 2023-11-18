variable "bucket_name" {
  description = "s3 bucket name"
  type        = string
}

variable "index_document" {
  type        = string
  description = "HTML to show at root"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "HTML to show on 404"
  default     = "error.html"
}

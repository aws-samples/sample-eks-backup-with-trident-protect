variable "kubernetes_version" {
  default     = 1.32
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "aws_region" {
  default     = "us-east-1"
  description = "aws region"
}

variable "fsxname" {
  default     = "fsxnprotect"
  description = "default fsx name"
}


variable "fsx_admin_password" {
  default     = "Netapp1!"
  description = "default fsx filesystem admin password"
}

variable "helm_config" {
  description = "NetApp Trident Helm chart configuration"
  type        = any
  default     = {}
}

variable "ui_service_public_ip" {
  description = "The public IP addess of the host that will access the sample application UI from the web browser"
}
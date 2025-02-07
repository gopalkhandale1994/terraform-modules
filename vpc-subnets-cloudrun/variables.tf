variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "region" {
  description = "The region in which to create the resources."
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets."
  type        = list(string)
}

variable "vpc_connector_name" {
  description = "The name of the VPC Access Connector."
  type        = string
}

variable "vpc_connector_ip_cidr_range" {
  description = "The IP CIDR range for the VPC Access Connector."
  type        = string
  default     = "10.8.0.0/28"  # Ensure this is a /28 subnet
}

variable "cloud_run_service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "cloud_run_image" {
  description = "The container image for the Cloud Run service."
  type        = string
}

variable "cloud_run_memory" {
  description = "The memory allocation for the Cloud Run service."
  type        = string
  default     = "512Mi"
}

variable "admin_roles" {
  type        = list(string)
  description = "Additional IAM roles which have admin cluster privileges"
  default     = []
}

variable "aws_namespace" {
  type        = list(string)
  default     = ["flightdeck"]
  description = "Prefix to be applied to created AWS resources"
}

variable "aws_tags" {
  type        = map(string)
  description = "Tags to be applied to created AWS resources"
  default     = {}
}

variable "cert_manager_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

variable "cluster_autoscaler_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "config_bucket" {
  description = "Name of the S3 bucket for storing Flightdeck configuration"
  type        = string
}

variable "custom_roles" {
  type        = map(string)
  description = "Additional IAM roles which have custom cluster privileges"
  default     = {}
}

variable "domain_filters" {
  type        = list(string)
  default     = []
  description = "Domains on which External DNS should update entries"
}

variable "external_dns_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

variable "k8s_namespace" {
  type        = string
  default     = "flightdeck"
  description = "Kubernetes namespace in which resources should be created"
}

variable "node_roles" {
  type        = list(string)
  description = "Additional node roles which can join the cluster"
  default     = []
}

variable "prometheus_operator_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

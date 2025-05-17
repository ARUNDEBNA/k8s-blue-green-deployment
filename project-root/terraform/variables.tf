variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  type        = string
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "bluegreen_eks" {
  name     = "bluegreen-eks"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy]
}

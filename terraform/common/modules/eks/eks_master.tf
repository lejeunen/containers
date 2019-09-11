resource "aws_eks_cluster" "this" {
  name            = var.cluster_name
  role_arn        = aws_iam_role.eks_master.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks_master.id]
    subnet_ids         = var.app_subnet_ids
  }

  depends_on = [
    "aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy",
  ]
}
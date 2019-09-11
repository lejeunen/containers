locals {
  env          = "dev"
  cluster_name = "${local.env}_eks"
  subnet_count = 2
  worker_ami = "ami-0f64557dd6506a4aa"  # See https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html
  keypair_name = "dev_eks"  # key pair must exist in your AWS account!
}


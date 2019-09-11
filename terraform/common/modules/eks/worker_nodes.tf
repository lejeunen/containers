########################################################################################
# Setup AutoScaling Group for worker nodes


# EKS currently documents this required userdata for EKS worker nodes to
# properly configure Kubernetes applications on the EC2 instance.
# We utilize a Terraform local here to simplify Base64 encode this
# information and write it into the AutoScaling Launch Configuration.
# More information: https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html
locals {
  tf-eks-node-userdata = <<USERDATA
#!/bin/bash -xe

sudo /etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.this.endpoint}' --b64-cluster-ca '${aws_eks_cluster.this.certificate_authority.0.data}' '${var.cluster_name}'
USERDATA
}

resource "aws_launch_configuration" "this" {
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.node.name
  image_id = "ami-01ffee931e45bb6bf"
  instance_type = "m4.large"
  name_prefix = "${var.env}_eks"
  security_groups = [
    aws_security_group.eks_node.id]
  user_data_base64 = base64encode(local.tf-eks-node-userdata)
  # TODO  key_name                    = "${var.keypair-name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity = "2"
  launch_configuration = aws_launch_configuration.this.id
  max_size = "2"
  min_size = "2"
  name = var.cluster_name
  vpc_zone_identifier = var.app_subnet_ids

  tag {
    key = "Name"
    value = var.cluster_name
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }

}
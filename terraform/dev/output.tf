output "kubeconfig" {
  value = module.eks.eks_kubeconfig
  sensitive = true
}
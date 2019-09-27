
resource "helm_release" "nginx-ingress" {
  name = "nginx-ingress"
  chart = "stable/nginx-ingress"
  namespace = "emasphere"


  values = [<<EOF
nginx-ingress:
  controller:
    hostNetwork: true
    service:
      type: NodePort
      annotations:
        kubernetes.io/ingress.class: nginx
      nodePorts:
        http: "30284"
      targetPorts:
          http: http
EOF
  ]

}

resource "aws_lb" "main" {
  name               = "main"
  internal           = false
  load_balancer_type = "application"
 # FIXME security_groups    = ["${aws_security_group.lb_sg.id}"]
  subnets            =  var.gateway_subnet_ids

}
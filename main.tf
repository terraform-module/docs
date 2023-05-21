module "ecrs" {
  source = "terraform-module/ecr/aws"

  ecrs = {
    api = {
      tags = { Service = "api" }
      lifecycle_policy = {
        rules = [{
          rulePriority = 1
          description  = "keep last 50 images"
          action = {
            type = "expire"
          }
          selection = {
            tagStatus   = "any"
            countType   = "imageCountMoreThan"
            countNumber = 50
          }
        }]
      }
    }
  }
}

module "ecs" {
  source  = "terraform-module/ecs/aws"
  version = "1.0.2"

  name               = "example"
  capacity_providers = ["FARGATE_SPOT"]
  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]

  tags = merge({ module = "terraform-module/ecs/aws" })
}

module "enforce-mfa" {
  source = "terraform-module/enforce-mfa/aws"
}

module "ecs-bootstrap" {
  source = "terraform-module/ecs-bootstrap/aws"

  name         = "example"
  cluster_id   = "4f901e4f4ef0"
  cluster_name = "dev-cluster"
  name_prefix  = "ext-"
  vpc_id       = "vpc-323eb3a0"
  subnets      = ["sbu-2345k8c"]

  lb = {
    create = "true"
    port   = "80"
    health_check = {
      path = "/healthz"
    }
    listener_arn = "arn:aws:elasticloadbalancing:eu-west-1:033338980111:listener/app/k8s-internal"
    priority     = 1
    lb_rules = {
      host_headers = ["www", "api", "auth", "admin"]
    }
  }
}

module "ecs-instance-profile" {
  source = "terraform-module/ecs-instance-profile/aws"
  # insert the 1 required variable here
  name = "example"
}

module "lambda" {
  source = "terraform-module/lambda/aws"

  function_name = "example"
  handler       = "index.handler"
  memory_size   = "128"
  filename      = "lambda.zip"
  description   = "example"
  role_arn      = "arn:aws:lambda:us-east-1:123456789012:function:example_lambda"
  runtime       = "python10"
  concurrency   = 1
}

module "gitlab-oidc-provider" {
  source = "terraform-module/gitlab-oidc-provider/aws"
}

module "github-oidc-provider" {
  source = "terraform-module/github-oidc-provider/aws"
}

module "acm" {
  source = "terraform-module/acm/aws"
}

module "dns" {
  source = "terraform-module/dns/aws"
  # insert the 3 required variables here
  subdomain            = ""
  parent_dns_zone_name = ""
  parent_dns_zone_id   = "42d37a58-f7ad-11ed-a94d-b71410c04d86"
}

module "kms" {
  source = "terraform-module/kms/aws"

  alias_name  = "parameter_store_key"
  description = "Key to encrypt and decrypt secrets"

  tags = tomap({ "used_by" = "chamber", "created_by" = "terraform" })
}

# HElm provider. Not a great idea to use it. Helm is way better

module "helm-release" {
  source = "terraform-module/release/helm"
  # insert the 3 required variables here
  repository = "https://github.com/terraform-module/docs"

  app = {
    name          = "nginx"
    version       = "2.2.0"
    chart         = "nginx"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }

  namespace = "default"
}

module "velero" {
  source = "terraform-module/velero/kubernetes"
  # insert the 5 required variables here
  cluster_name                = "dev-cluster"
  openid_connect_provider_uri = "openid-configuration"
  bucket                      = "backup-s3"

  values = [<<EOF
    # https://github.com/terraform-module/terraform-kubernetes-velero
  EOF
  ]
}


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
  # insert the 1 required variable here
}

module "enforce-mfa" {
  source = "terraform-module/enforce-mfa/aws"
}

module "ecs-bootstrap" {
  source = "terraform-module/ecs-bootstrap/aws"
  # insert the 6 required variables here
}

module "ecs-instance-profile" {
  source = "terraform-module/ecs-instance-profile/aws"
  # insert the 1 required variable here
}

module "lambda" {
  source = "terraform-module/lambda/aws"
  # insert the 14 required variables here
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
}

module "kms" {
  source = "terraform-module/dns/aws"

  alias_name  = "parameter_store_key"
  description = "Key to encrypt and decrypt secrets"

  tags = map("USED_BY", "chamber")
}

# HElm provider. Not a great idea to use it. Helm is way better

module "helm-release" {
  source = "terraform-module/release/helm"
  # insert the 3 required variables here
}

module "velero" {
  source = "terraform-module/velero/kubernetes"
  # insert the 5 required variables here
}


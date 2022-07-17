# Module Blueprint

[Terraform modules](https://registry.terraform.io/namespaces/terraform-module)

Everything is 100% Open Source and licensed under the [MIT](LICENSE).

All modules created with this [awesome blueprint](https://github.com/terraform-module/terraform-module-blueprint).

[![Modules][logo]][website]

## Modules

| **Module**                        |    **Git Location**      | **Description**                    |
|:---------------------------------- |:--------------------------|:-----------------------------------|
|           **ECS**                  |
| [ECS][ecs.module]                  | [git](ecs.git)            | Terraform module which creates AWS ECS resources.
| [ECS Bootstrap][ecs-boot.module]   | [git](ecs-boot.git)       | Terraform AWS ECS services bootstrap module.
| [ECR(s)][ecrs.module]              | [git](ecrs.git)           | Terraform module which creates AWS ECR resources.
| [ECS Profile][ecs-prof.module]      | [git](ecs-prof.git)       | Terraform AWS ECS instance profile.
|           **Serverless**           |
| [Lambda][lambda.module]            | [git](lambda.git)         | Deploy serverless function to AWS VPC.
|           **IAM**                  |
| [Enforce MFA][mfa.module]          | [git](mfa.git)            | Terraform module which creates AWS ECR resources.
|           **OIDC**                 |
| [OIDC GIT][oidc-git.module]        | [git](oidc-git.git)       | Fully configurable terraform module to access AWS APIs from Github Actions through OpenID Connect.
| [OIDC GITLAB][oidc-gitlab.module]  | [git](oidc-gitlab.git)    | Fully configurable terraform module to access AWS APIs from Gitlab through. OpenID Connect.
|           **General**              |
| [Cloudfront CDN][cloudfront.module]| [git](cloudfront.git)     | Terraform AWS Cloudfront.
| [ACM][aws-acm.module]              | [git](aws-acm.git)        | Terraform AWS ACM module.
| [DNS][aws-dns.module]              | [git](aws-dns.git)        | AWS DNS setup .
|           **Kubernetes**           |
| [Helm][helm.module]                | [git](helm.git)           | App release with terraform and helm.
| [Velero][helm-velero.module]       | [git](helm-velero.git)    | Deploy velero to kubernetes.

# Authors

Currently maintained by [Ivan Katliarchuk](https://github.com/ivankatliarchuk) and these [awesome contributors](https://github.com/terraform-module/terraform-module-blueprint/graphs/contributors).

[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)

[logo]: assets/open-source-modules.svg
[website]: https://github.com/orgs/terraform-module/repositories

[ecrs.module]: https://registry.terraform.io/modules/terraform-module/ecrs/aws
[ecrs.git]: https://github.com/terraform-module/terraform-aws-ecr

[lambda.module]: https://registry.terraform.io/modules/terraform-module/lambda/aws
[lambda.git]: https://github.com/terraform-module/terraform-aws-lambda

[mfa.module]: https://registry.terraform.io/modules/terraform-module/enforce-mfa/aws
[mfa.git]: https://github.com/terraform-module/terraform-aws-enforce-mfa

[ecs.module]: https://registry.terraform.io/modules/terraform-module/ecs/aws
[ecs.git]: https://github.com/terraform-module/terraform-aws-ecs

[ecs-boot.module]: https://registry.terraform.io/modules/terraform-module/ecs-bootstrap/aws
[ecs-boot.git]: https://github.com/terraform-module/terraform-aws-ecs-bootstrap

[ecs-prof.module]: https://registry.terraform.io/modules/terraform-module/ecs-instance-profile/aws/latest
[ecs-prof.git]: https://github.com/terraform-module/terraform-aws-ecs-instance-profile

[oidc-git.module]: https://registry.terraform.io/modules/terraform-module/github-oidc-provider/aws/latest
[oidc-git.git]: https://github.com/terraform-module/terraform-aws-github-oidc-provider

[oidc-gitlab.module]: https://registry.terraform.io/modules/terraform-module/gitlab-oidc-provider/aws
[oidc-gitlab.git]: https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider

[cloudfront.module]: https://registry.terraform.io/modules/terraform-module/cloudfront/aws/latest
[cloudfront.git]: https://github.com/terraform-module/terraform-aws-cloudfront

[aws-acm.module]: https://registry.terraform.io/modules/terraform-module/acm/aws
[aws-acm.git]: https://github.com/terraform-module/terraform-aws-acm

[aws-dns.module]: https://registry.terraform.io/modules/terraform-module/dns/aws/latest
[aws-dns.git]: https://github.com/terraform-module/terraform-aws-dns

[helm-velero.module]: https://registry.terraform.io/modules/terraform-module/velero/kubernetes/latest
[helm-velero.git]: https://github.com/terraform-module/terraform-kubernetes-velero

[helm.module]: https://registry.terraform.io/modules/terraform-module/release/helm/latest
[helm.git]: https://github.com/terraform-module/terraform-helm-release


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr          = var.vpc_cidr
  vpc_cidr_public1  = var.vpc_cidr_public1
  vpc_cidr_public2  = var.vpc_cidr_public2
  vpc_cidr_private1 = var.vpc_cidr_private1
  vpc_cidr_private2 = var.vpc_cidr_private2
}


module "iam" {
  source = "./modules/iam"
}


module "acm" {
  source      = "./modules/acm"
  domain_name = var.domain_name
  
}


module "cloudflare_validation" {
  source = "./modules/cloudflare_validation"

  providers = {
    cloudflare = cloudflare
  }

  zone_id = var.cloudflare_zone_id
  domain_validation_options = module.acm.domain_validation_options
}


resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = module.acm.certificate_arn

  validation_record_fqdns = module.cloudflare_validation.validation_records
}

module "alb" {
  source = "./modules/alb"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  certificate_arn   = module.acm.certificate_arn

  depends_on = [aws_acm_certificate_validation.cert_validation]
}

module "ecs" {
  source = "./modules/ecs"

  ecs_cpu        = var.ecs_cpu
  ecs_memory     = var.ecs_memory
  container_port = var.container_port
  host_port      = var.host_port
  image_uri      = var.image_uri
  image_tag      = var.image_tag

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  alb_sg_id        = module.alb.alb_sg_id
  target_group_arn = module.alb.target_group_arn

  aws_iam_role_arn = module.iam.ecs_task_execution_role_arn

  depends_on = [module.alb]
}

module "cloudflare" {
  source = "./modules/cloudflare"

  providers = {
    cloudflare = cloudflare
  }

  zone_id      = var.cloudflare_zone_id
  alb_dns_name = module.alb.alb_dns_name

  depends_on = [module.alb]
}
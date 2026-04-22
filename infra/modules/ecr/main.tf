resource "aws_ecr_repository" "app_repository" {
  name                 = "threat-composer-app"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "Threat Composer App Repository"
  }
}


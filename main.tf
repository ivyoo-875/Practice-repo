module "ec2_creation" {
  source = "./modules/ec2"

  ami_id_1        = var.ami_id_1
  ami_id_2        = var.ami_id_2
  instance_type_1 = var.instance_type_1
  instance_type_2 = var.instance_type_2
}
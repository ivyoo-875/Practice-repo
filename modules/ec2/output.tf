output "aws_public_ip1" {
    value = aws_instance.instance1.public_ip
}

output "aws_public_ip2" {
    value = aws_instance.instance2.public_ip
}

output "subnet_one" {
    value= aws_subnet.subnet1.id
}

output "subnet_two" {
    value= aws_subnet.subnet2.id
}
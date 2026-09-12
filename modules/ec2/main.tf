resource "aws_vpc" "vpc" {
   cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
}


resource "aws_internet_gateway" "internet" {
    vpc_id = aws_vpc.vpc.id
}


resource "aws_route_table" "table" {
    vpc_id = aws_vpc.vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id=aws_internet_gateway.internet.id
    }
}

resource "aws_route_table_association" "association1" {
    route_table_id=aws_route_table.table.id
    subnet_id = aws_subnet.subnet1.id
}

resource "aws_route_table_association" "association2" {
    route_table_id=aws_route_table.table.id
    subnet_id = aws_subnet.subnet2.id
}


resource "aws_instance" "instance1" {
    ami = var.ami_id_1
    instance_type = var.instance_type_1
    subnet_id = aws_subnet.subnet1.id
}

resource "aws_instance" "instance2" {
    ami = var.ami_id_2
    instance_type = var.instance_type_2
    subnet_id = aws_subnet.subnet2.id
}


# https://www.terraform.io/downloads.html

provider "aws" {
	#variável lida do arquivo variable.tf
    region = "${var.aws_region}"
}

resource "aws_security_group" "ec26b60732" {
    description = "SG do e-commerce de exemplo do livro "
    name = "sg_ecommerce"
    vpc_id = "vpc-b3b8ffc9"
}

resource "aws_security_group" "ec2fe33695" {
    description = "SG do e-commerce de exemplo do livro "
    name = "sg_ecommerce"
    vpc_id = "vpc-b3b8ffc9"
}

resource "aws_instance" "ec224da8f4" {
    ami = "ami-09d95fab7fff3776c"
    key_name = "maq-win-key"
    vpc_security_group_ids = [
        "sg-0df8cf7a9d6559713"
    ]
    instance_type = "t2.micro"
    tenancy = "default"
    monitoring = false
    disable_api_termination = false
    instance_initiated_shutdown_behavior = "stop"
    credit_specification {
        cpu_credits = "standard"
    }

    tags = {
        projeto = "livro-microsservicos"
    }

    ebs_optimized = false
    root_block_device {
        volume_type = "gp2"
        volume_size = 8
    }
#user data, onde se pode adicionar comandos a serem executados apos a criação das instâncias
    user_data = <<EOF
		#! /bin/bash	
		sudo yum update -y
		sudo yum install java  -y
		sudo yum install git  -y
		sudo yum install maven  -y
		EOF
}
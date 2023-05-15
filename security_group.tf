# security group NO.7
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#########################################################

# security group NO.8
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [module.my_network.vpc_cidr]
  }

  ingress {
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [module.my_network.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # mraning all trafic
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

##########################################################

# security group of DB
resource "aws_security_group" "database_sg" {
  name        = "database_sg"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#############################################################

 # security group of Elasticache
resource "aws_security_group" "Elasticache_sg" {
  name_prefix = "Elasticache"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
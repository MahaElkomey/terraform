resource "aws_elasticache_subnet_group" "elasticacheSubnetGroup" {
  name       = "mahaelkomey120399"
  subnet_ids = [module.my_network.private_subnet_1_id, module.my_network.private_subnet_2_id]
}

resource "aws_elasticache_cluster" "elasti_cache" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  security_group_ids = [aws_security_group.Elasticache_sg.id]
  availability_zone = var.AZ_1
  subnet_group_name = aws_elasticache_subnet_group.elasticacheSubnetGroup.name
  engine_version       = "3.2.10"
  port                 = 6379
}

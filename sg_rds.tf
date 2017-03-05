# Security Group for RDS
resource "aws_security_group" "rds-app-prod" {
  vpc_id = "${aws_vpc.main.id}"
  name = "rds-app-prod"
  description = "Allow inbound MySQL traffic"
  tags {
    Name = "rds-app-prod"
  }
}
resource "aws_security_group_rule" "allow-outgoing" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.rds-app-prod.id}"
    cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow-mysql" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.rds-app-prod.id}"
    source_security_group_id = "${aws_security_group.app-prod.id}"
}

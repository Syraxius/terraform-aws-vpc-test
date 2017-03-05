# Security Group for app
resource "aws_security_group" "app-prod" {
  vpc_id = "${aws_vpc.main.id}"
  name = "app-prod"
  description = "App prod security group"
  tags {
    Name = "app-prod"
  }
}
resource "aws_security_group_rule" "allow-outgoing-app" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.app-prod.id}"
    cidr_blocks = ["0.0.0.0/0"]
}

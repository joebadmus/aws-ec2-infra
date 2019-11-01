data "template_file" "web_data" {
  template = "${file("template/web-server-data.tpl")}"
}

resource "aws_instance" "webBox" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  ebs_optimized               = false
  key_name                    = "${var.key_name}"
  user_data                   = "${data.template_file.web_data.rendered}"
  #subnet_id                   = "${aws_subnet.public[0]}"
  subnet_id              = "${element(aws_subnet.public.*.id, 0)}"
  vpc_security_group_ids = ["${aws_security_group.web_allow.id}"]

  tags = {
    Name = "webBox"
  }
}

resource "aws_security_group" "web_allow" {
  name        = "allow_web"
  description = "Allow http inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webBox SG"
  }
}


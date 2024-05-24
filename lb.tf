resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.main.id

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
}

resource "aws_lb_target_group" "default" {
  name     = "demo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb" "default" {
  name               = "demo-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public[0].id, aws_subnet.public[1].id]
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_lb_listener" "default" {
  load_balancer_arn = aws_lb.default.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}

resource "aws_lb_target_group_attachment" "default" {
  target_group_arn = aws_lb_target_group.default.arn
  target_id        = aws_instance.backend_instance_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "default1" {
  target_group_arn = aws_lb_target_group.default.arn
  target_id        = aws_instance.backend_instance_2.id
  port             = 80
}

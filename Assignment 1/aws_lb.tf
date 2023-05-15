resource "aws_lb" "my_load_balancer" {
  name               = "myLB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_security_group.id]
  subnets            = [aws_subnet.my_subnet.id]

  tags = {
    Name = "myLB"
  }
}

resource "aws_lb_target_group_attachment" "my_attachment" {
  target_group_arn = aws_lb.my_load_balancer.arn
  target_id        = aws_instance.web[1].id
  port             = 80
}
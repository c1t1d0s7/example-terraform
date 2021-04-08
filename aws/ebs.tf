#resource "aws_ebs_volume" "wp-ebs" {
#  availability_zone = var.AZS[0]
#  size              = 1
#
#  tags = {
#    Name = "wp-ebs"
#  }
#}

#resource "aws_volume_attachment" "wp-web-ebs" {
#  device_name = "/dev/xvdb"
#  volume_id   = aws_ebs_volume.wp-ebs.id
#  instance_id = aws_instance.wp-web.id
#}


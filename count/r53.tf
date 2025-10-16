resource "aws_route53_record" "roboshop" {
  count = 3
  zone_id = "${var.zone_id}"
  name    = "${var.instances[count.index]}.${var.domain_name}"  ### mongodb.rajkumardaws.space
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}
variable "AWS_REGION" {
  type    = string
  default = "ap-northeast-2"
}

variable "AZS" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
}

variable "MGMT_IP" {
  type    = string
  #default = "218.152.123.251/32"
  default = "0.0.0.0/0"
}

variable "CIDR" {
  type    = string
  default = "192.168.0.0/16"
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "SSH_KEY" {
  type    = string
  default = "./keypair/mykey.pub"
}

variable "WP_SCRIPT" {
  type    = string
  default = "./script/wp-deploy.sh"
}

variable "DB_PWD" {
  type = string
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-1 = "ami-04fe60822d08387bb",
    ap-northeast-2 = "ami-05f375b54be4ab849"
  }
}


variable "ami_ubuntu"{
   # region = "eu-north-1"
    default="ami-0914547665e6a707c"
  #region = "us-east-1"
    # default="ami-080e1f13689e07408"
}

variable "instance_type"{
   # region = "eu-north-1"
    default = "t3.micro"
  #region = "us-east-1"
    # default = "t2.micro"
}
variable "cidr" {
  default = "10.0.0.0/16"
}

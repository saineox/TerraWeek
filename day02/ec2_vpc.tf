resource "aws_instance" "react-app"{
    ami = var.ami_ubuntu
    instance_type =var.instance_type
    user_data  = base64encode(file("userdata.sh"))
     key_name=aws_key_pair.mykey.key_name
     security_groups = [aws_security_group.sg_allow_ssh.name]
    tags= {
        Name= "terra-auto-instance"
    }
     #user_data = base64encode(file("userdata.sh"))
}

resource "aws_key_pair" "mykey"{
    key_name= "terra_key"
    public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuKYmwAJk45LLb+XdqLt6+pSEjfttql7fuVoEJxQ5ukCCVWxw3mmYAsODb8aie2X+8d47fGfnfiFyIYmkMg5gdv+1XUTWMq9qNCYq3fvOdAnEKbQvqdU2m6YUE1pfOfrHD8x+KKGPmZ4D5C9d0McOeu9a/KfX0lyhSiWyL9cNEw6Ionw4QLd8LCwKqjxnErXO71rNcbcam3ED/wrTEziIt7sKeUTGnE7X/2i8ak4Mp+vmGweNj/eVAy0qK5exVq9qUD6lyqiUhnbrLRPXsBBA7Bvn7Lszgx+anELGgMmlP5FD/sfHadCKKU8wimUnJsi0qEPTD/dDfrhDjBgn9K41B ubantu1"
   # public_key=file("")
}

resource "aws_default_vpc" "default_vpc"{

}

resource "aws_security_group" "sg_allow_ssh"{
    name= "allow_ssh"
    description = "allow ssh Inbound traffic"
    vpc_id = aws_default_vpc.default_vpc.id

    ingress {
        description="SSH"
        protocol = "tcp"
        from_port=22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    description = "HTTP ON"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        description="All-trafic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "test-ec2" {
    instance_type = "t2.micro"
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.public_subnet.id
    key_name = aws_key_pair.deployer.key_name
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhMtzdmITsC5R6qwETamSM/kzM7ymXTC/ICuoO68DhK+v4ABZ+UWp24HVwzlwAcsRoZdGNDVYRzCsCwokOPtPI3YafAHNsw7SkkARDMLeyajxSzNyQkghF4KjLHtVro8CaDVMuAxgOBcvZAzNzMRaovnQxZeE1qjD05js25D9GN4x12sKoojWSamO0v2ieuzYSdKYG3sy1wYWjWxW0gDxSiVPpGRyVHzlyvbuZ1islI7SOM6ah5QwaFZG94BU3VVoRVUbz0RR0tly7LjILK0IHWkItL1dfBL0x2Y8Vm3gojryc3VqxHhB1V3zsaF+msOefyvQUvmlyiTlg+7K6sz6Up/inn5UGaw6Y0LLNnlNNEV164+5E1XhQwHCHo2d7ZHKYOv5WlDjhRv2NwwDUvsSRn8TwwHGRVvzwz6YwVaDolBYPRAhmb1RKGYx+zHg62bm34pAbDQOaeohKuEjjvOERmICy/uqrKbEj/gFAcaYz9qjz0bWzZEyn6CCqGN5PLOk= jainkuma@jainkuma-mac.local"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "base-ami" {
  #! aws access and secret keys are set in environment variables.
  // access_key  = ""
  // secret_key  = ""
  region        = "us-east-1"
  instance_type = "t2.micro"
  ami_name      = "packer-base-ami ${local.timestamp}"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  ssh_username  = "ubuntu"
  ssh_interface = "session_manager"
  communicator  = "ssh"

}

build {
  name = "first build"
  sources = ["source.amazon-ebs.base-ami"]
}
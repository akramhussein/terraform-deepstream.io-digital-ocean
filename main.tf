variable "do_token" {}

variable "droplet_name" {}

variable "droplet_region" {}

variable "droplet_size" {}

variable "public_key" {}

variable "private_key" {}

variable "deepstream_docker_tag" {}

# Configure the Digital Ocean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

data "template_file" "deepstream" {
  template = "${file("deepstream.sh.tpl")}"

  vars {
    deepstream_docker_tag = "${var.deepstream_docker_tag}"
  }
}

# Create Droplet w/ Docker for Deepstream.io
resource "digitalocean_droplet" "deepstream" {
  image  = "docker"
  name   = "${var.droplet_name}"
  region = "${var.droplet_region}"
  size   = "${var.droplet_size}mb"

  ipv6               = true
  private_networking = true

  ssh_keys = [
    "${digitalocean_ssh_key.deepstream.fingerprint}",
  ]

  connection {
    user     = "root"
    type     = "ssh"
    key_file = "${var.private_key}"
    timeout  = "2m"
  }

  provisioner "remote-exec" {
    inline = ["${data.template_file.deepstream.rendered}"]
  }
}

resource "digitalocean_floating_ip" "deepstream" {
  droplet_id = "${digitalocean_droplet.deepstream.id}"
  region     = "${digitalocean_droplet.deepstream.region}"
}

resource "digitalocean_ssh_key" "deepstream" {
  name       = "deepstream-public-ssh-key"
  public_key = "${var.public_key}"
}
